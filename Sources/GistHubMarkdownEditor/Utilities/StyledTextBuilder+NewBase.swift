import UIKit
import StyledTextKit

extension StyledTextBuilder {
    static func markdownBase() -> StyledTextBuilder {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 12
        paragraphStyle.lineSpacing = 2

        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Colors.foregroundDefault.color,
            .paragraphStyle: paragraphStyle,
            .backgroundColor: Colors.background.color
        ]

        let style = Text.body

        return StyledTextBuilder(styledText: StyledText(
            style: style.with(attributes: attributes))
        )
    }
}
