import UIKit
import StyledTextKit

final class MarkdownCodeBlockModel: NSObject, BlockNode {
    var identifier: String {
        description
    }

    let code: StyledTextRenderer
    let language: String?

    init(code: StyledTextRenderer, language: String?) {
        self.code = code
        self.language = language
    }

    var contentSize: CGSize {
        code.viewSize(in: 0)
    }

    static func makeModel(
        text: String,
        language: String?,
        contentSizeCategory: UIContentSizeCategory
    ) -> MarkdownCodeBlockModel {
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let fixedLanguage = language?.isEmpty == true ? nil : language
        let attributedString: NSAttributedString
        if let language = fixedLanguage,
           let highlighted = GitHubHighlighting.highlight(trimmedText, as: language) {
            attributedString = highlighted
        } else {
            attributedString = NSAttributedString(
                string: trimmedText,
                attributes: [
                    .foregroundColor: Colors.foregroundDefault.color,
                    .font: Text.code.font(contentSizeCategory: contentSizeCategory)
                ]
            )
        }

        var inset = MarkdownCodeBlockCell.textViewInset
        inset.left += MarkdownCodeBlockCell.scrollViewInset.left
        inset.right += MarkdownCodeBlockCell.scrollViewInset.right

        let backgroundColor = Colors.canvasSubtitle.color
        let builder = StyledTextBuilder(attributedText: attributedString)
            .add(attributes: [.backgroundColor: backgroundColor])

        let string = StyledTextRenderer(
            string: builder.build(),
            contentSizeCategory: contentSizeCategory,
            inset: inset,
            backgroundColor: backgroundColor
        ).warm(width: 0)
        return MarkdownCodeBlockModel(code: string, language: fixedLanguage)
    }
}
