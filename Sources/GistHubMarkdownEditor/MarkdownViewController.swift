import UIKit

public final class MarkdownViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .red
        return view
    }()

    private var models: [BlockNode] = []

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}
