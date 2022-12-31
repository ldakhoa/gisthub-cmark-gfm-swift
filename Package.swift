// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GistHubMarkdownPreview",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "GistHubMarkdownPreview",
            targets: ["GistHubMarkdownPreview"])
    ],
    dependencies: [
        .package(url: "https://github.com/alexaubry/HTMLString", from: "6.0.0"),
        .package(url: "https://github.com/raspu/Highlightr", from: "2.1.2")
    ],
    targets: [
        .target(
            name: "GistHubMarkdownPreview",
            dependencies: [
                "cmark-gfm-swift",
                "HTMLString",
                "Highlightr",
            ],
            resources: [.process("Resources")]
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
