import SwiftUI

public struct MarkdownPreviewView: View {
    let markdown: String

    @State private var previewHeight: CGFloat = 0

    public init(markdown: String) {
        self.markdown = markdown
    }

    public var body: some View {
        MarkdownPreviewViewRepresentable(markdown: markdown)
            .onReceive(Notification.Name(rawValue: "markdownPreviewShouldUpdateHeight")) { notification in
                guard let height = notification.object as? CGFloat else { return }
                previewHeight = height
            }
            .frame(height: previewHeight)
    }
}

private struct MarkdownPreviewViewRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = MarkdownPreviewViewController

    let markdown: String

    init(markdown: String) {
        self.markdown = markdown
    }

    func makeUIViewController(context: Context) -> MarkdownPreviewViewController {
        let controller = MarkdownPreviewViewController(markdown: markdown)
        return controller
    }

    func updateUIViewController(
        _ uiViewController: MarkdownPreviewViewController,
        context: Context
    ) {
    }
}

private extension MarkdownPreviewViewRepresentable {
    func onReceive(
        _ notificationName: Notification.Name,
        object: AnyObject? = nil,
        perform action: @escaping (Notification) -> Void
    ) -> some View {
        onReceive(
            NotificationCenter.default.publisher(
                for: notificationName,
                object: object),
            perform: action
        )
    }
}
