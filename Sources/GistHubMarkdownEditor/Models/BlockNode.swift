import Foundation

public protocol BlockNode {
    var identifier: String { get }
}

public final class BlockModel {
    let models: [BlockNode]

    init(models: [BlockNode]) {
        self.models = models
    }
}
