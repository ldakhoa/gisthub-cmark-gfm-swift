// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GistHubMarkdownEditor",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "GistHubMarkdownEditor",
            targets: ["GistHubMarkdownEditor"]),
        .library(
            name: "StyledTextKit",
            targets: ["StyledTextKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GistHubMarkdownEditor",
            dependencies: []
        ),
        .testTarget(
            name: "GistHubMarkdownEditorTests",
            dependencies: ["GistHubMarkdownEditor"]
        ),
        .target(
            name: "StyledTextKit",
            dependencies: []
        ),
        .testTarget(
            name: "StyledTextKitTests",
            dependencies: ["StyledTextKit"]
        ),
    ]
)
