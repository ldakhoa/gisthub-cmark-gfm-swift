import Foundation

enum MarkdownAttribute {
    static let url = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.url-name")
    static let email = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.email-name")
    static let username = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.username-name")
    static let usernameDisabled = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.username-disabled-name")
    static let linkShorteningDisabled = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.link-shortening-disabled-name")
    static let issue = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.issue")
    static let details = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.details")
    static let label = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.label")
    static let commit = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.commit")
    static let checkbox = NSAttributedString.Key(rawValue: "com.gisthub.Markdown.checkbox")

    static let all = Set<NSAttributedString.Key>([
        url,
        email,
        username,
        usernameDisabled,
        linkShorteningDisabled,
        issue,
        details,
        label,
        commit,
        checkbox
    ])
}
