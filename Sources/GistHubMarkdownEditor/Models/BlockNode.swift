import Foundation

public protocol BlockNode {
    var identifier: String { get }
}

public final class BlockModel {
    let nodes: [BlockNode]

    init(nodes: [BlockNode]) {
        self.nodes = nodes
    }
}
