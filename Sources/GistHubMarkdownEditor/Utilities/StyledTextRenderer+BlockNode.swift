import StyledTextKit

extension StyledTextRenderer: BlockNode {
    public var identifier: String {
        "\(self.string.hashValue)"
    }
}
