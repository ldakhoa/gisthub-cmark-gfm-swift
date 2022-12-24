import Foundation
import Highlightr

enum GitHubHighlighting {
    private static var shared: Highlightr? = {
        let view = Highlightr()
        view?.setTheme(to: "github")
        view?.theme.setCodeFont(Text.code.preferredFont)
        return view
    }()

    static func highlight(_ code: String, as language: String) -> NSAttributedString? {
        let fixedLanguage = language.isEmpty ? nil : language
        return shared?.highlight(code, as: fixedLanguage, fastRender: true)
    }

    static func highlight(_ code: String) -> NSAttributedString? {
        shared?.highlight(code)
    }
}
