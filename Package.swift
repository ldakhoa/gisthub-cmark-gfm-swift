// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gisthub-cmark-gfm-swift",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "cmark-gfm-swift",
            targets: ["cmark-gfm-swift"])
    ],
    dependencies: [],
    targets: [
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
