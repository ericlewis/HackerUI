// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "HackerUI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "HackerUI",
            targets: ["HackerUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ericlewis/HackerKit.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "HackerUI",
            dependencies: ["HackerKit"]),
        .testTarget(
            name: "HackerUITests",
            dependencies: ["HackerUI"]),
    ]
)
