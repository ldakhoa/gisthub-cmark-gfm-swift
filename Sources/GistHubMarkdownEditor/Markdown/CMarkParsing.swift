import UIKit
import StyledTextKit
import cmark_gfm_swift
import HTMLString

private struct CMarkOptions {
    let contentSizeCategory: UIContentSizeCategory
    let viewerCanUpdate: Bool
    let width: CGFloat
}

private struct CMarkContext {
    let inLink: Bool
    init(inLink: Bool = false) {
        self.inLink = inLink
    }
}

private enum TextElementPosition {
    case first
    case neck
    case last
}

private extension TextElement {
    @discardableResult
    func build(
        _ builder: StyledTextBuilder,
        options: CMarkOptions,
        position: TextElementPosition,
        context: CMarkContext = CMarkContext()
    ) -> StyledTextBuilder {
        builder.save()
        defer {
            builder.restore()
        }

        switch self {
        case .text(let text):
            let text = text
                .strippingHTMLComments
                .removingHTMLEntities()
            builder.add(text: text)
        case .softBreak:
            switch position {
            case .first, .last:
                break
            case .neck:
                builder.add(text: "\u{2028}")
            }
        case .lineBreak:
            builder.add(text: "\n")
        case .code(let text):
            builder.add(styledText: StyledText(text: text))
        case .emphasis(let children):
            builder.add(traits: .traitItalic)
            children.build(builder, options: options, context: context)
        case .strong(let children):
            builder.add(traits: .traitBold)
            children.build(builder, options: options, context: context)
        case .strikethrough(let children):
            builder.add(attributes: [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                .strikethroughColor: builder.tipAttributes?[.foregroundColor] ?? Colors.foregroundDefault.color as AnyHashable
            ])
            children.build(builder, options: options, context: context)
//        case .link(let children, _, let url):

//        case .mention(let login):
        case .checkbox(let checked, let originalRange):
            builder.addCheckbox(
                checked: checked,
                range: originalRange,
                viewerCanUpdate: options.viewerCanUpdate)
        default:
            break
        }
        return builder
    }
}

private extension Array where Iterator.Element == TextElement {
    @discardableResult
    func build(
        _ builder: StyledTextBuilder,
        options: CMarkOptions,
        context: CMarkContext = CMarkContext()
    ) -> StyledTextBuilder {
        for (i, el) in enumerated() {
            let position: TextElementPosition
            switch i {
            case 0: position = .first
            case count - 1: position = .last
            default: position = .neck
            }
            el.build(
                builder,
                options: options,
                position: position,
                context: context
            )
        }
        return builder
    }
}

private extension ListElement {
    @discardableResult
    func build(_ builder: StyledTextBuilder, options: CMarkOptions) -> StyledTextBuilder {
        switch self {
        case .text(let text):
            text.build(builder, options: options)
        case .list(let childer, let type, let level):
            childer.build(builder, options: options, type: type, level: level)
        }
        return builder
    }
}

private extension Array where Iterator.Element == [ListElement] {
    /// Build Unordered and Ordered list
    @discardableResult
    func build(
        _ builder: StyledTextBuilder,
        options: CMarkOptions,
        type: ListType,
        level: Int = 0
    ) -> StyledTextBuilder {
        builder.save()

        defer { builder.restore() }

        // unicode character to newline without creating a new paragraph to avoid NSParagraphStyle spacing
        let newline = "\u{2028}"

        for (i, c) in enumerated() {
            let tick: String
            switch type {
            case .unordered:
                tick = level % 2 == 0
                    ? Constants.Strings.bullet
                    : Constants.Strings.bullet
            case .ordered:
                tick = "\(i + 1)."
            }

            var spaces = ""

            for _ in 0 ..< level {
                spaces += "  "
            }

            builder.add(text: "\(spaces)\(tick)")

            c.forEach ({ cc in
                cc.build(builder, options: options)
            }, joined: { _ in
                builder.add(text: newline)
            })
        }
        return builder
    }
}

private extension Array {
    func forEach(_ body: (Element) -> Void, joined: (Element) -> Void) {
        for (i, e) in enumerated() {
            body(e)
            if i != count - 1 {
                joined(e)
            }
        }
    }
}

private func makeModels(elements: [Element], options: CMarkOptions) -> [BlockNode] {
    var models = [BlockNode]()
    var runningBuilder: StyledTextBuilder?

    let makeBuilder: () -> StyledTextBuilder = {
        let builder: StyledTextBuilder
        if let current = runningBuilder {
            builder = current
                .add(text: "\n")
        } else {
            builder = StyledTextBuilder.markdownBase()
        }
        runningBuilder = builder
        return builder
    }

    let endRunningText: (Bool) -> Void = { isLast in
        if let builder = runningBuilder {
            models.append(
                StyledTextRenderer(
                    string: builder.build(),
                    contentSizeCategory: options.contentSizeCategory,
                    inset: UIEdgeInsets(top: 2, left: 0, bottom: 8, right: 0),
                    backgroundColor: Colors.background.color
                )
                .warm(width: options.width)
            )
        }
        runningBuilder = nil
    }

    for (i, el) in elements.enumerated() {
        let isLast = i == elements.count - 1

        switch el {
        case .text(let items):
            items.build(makeBuilder(), options: options)
        case .heading(let text, let level):
            let style: TextStyle
            switch level {
            case 1: style = Text.h1
            case 2: style = Text.h2
            case 3: style = Text.h3
            case 4: style = Text.h4
            case 5: style = Text.h5
            default:
                style = Text.h6
            }

            let builder = makeBuilder()
                .save()
                .add(style: style)

            builder.add(attributes: [.baselineOffset: 12])
            text.build(builder, options: options)

            builder.restore()
        case .quote(let items, let level):
            endRunningText(isLast)

            let builder = StyledTextBuilder.markdownBase()
                .add(attributes: [.foregroundColor: Colors.muted.color])

            let string = StyledTextRenderer(
                string: items.build(builder, options: options).build(),
                contentSizeCategory: options.contentSizeCategory,
                inset: MarkdownQuoteCell.inset(quoteLevel: level),
                backgroundColor: Colors.background.color
            ).warm(width: options.width)
            models.append(MarkdownQuoteModel(level: level, string: string))
//        case .image(let title, let url):
//
//        case .html(let text):
//
//        case .table(let rows):
//
//        case .hr:
//
//        case .codeBlock(let text, let language):
//
        case .list(let items, let type):
            items.build(makeBuilder(), options: options, type: type)
        default: break

        }
    }

    endRunningText(true)

    return models
}

public struct MarkdownModels {
    public func build(
        _ markdown: String,
        width: CGFloat,
        viewerCanUpdate: Bool,
        contentSizeCategory: UIContentSizeCategory
    ) -> [BlockNode] {
        let cleaned = markdown.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let node = Node(markdown: cleaned) else { return [] }

        let options = CMarkOptions(
            contentSizeCategory: contentSizeCategory,
            viewerCanUpdate: viewerCanUpdate,
            width: width)

        let models = makeModels(elements: node.flatElements, options: options)

        return models
    }
}
