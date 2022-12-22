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
        .library(
            name: "cmark-gfm-swift",
            targets: ["cmark-gfm-swift"])
    ],
    dependencies: [
        .package(url: "https://github.com/alexaubry/HTMLString", from: "6.0.0"),
    ],
    targets: [
        .target(
            name: "GistHubMarkdownEditor",
            dependencies: [
                "StyledTextKit",
                "cmark-gfm-swift",
                "HTMLString"
            ]
        ),

        .target(
            name: "StyledTextKit",
            dependencies: []
        ),
        .testTarget(
            name: "StyledTextKitTests",
            dependencies: ["StyledTextKit"]
        ),
        .target(
            name: "cmark-gfm-swift",
            dependencies: ["cmark_gfm"]
        ),
        .target(
            name: "cmark_gfm",
            path: "Sources/cmark_gfm"
        )
    ]
)
