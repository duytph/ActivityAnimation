// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ActivityAnimation",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "ActivityAnimation",
            targets: ["ActivityAnimation"]),
    ],
    dependencies: [
        .package(
            name: "Lottie",
            url: "https://github.com/airbnb/lottie-ios.git",
            from: "3.1.9"),
    ],
    targets: [
        .target(
            name: "ActivityAnimation",
            dependencies: ["Lottie"],
            resources: [.copy("Resources/rainbow-loading-spinner.json")]),
        .testTarget(
            name: "ActivityAnimationTests",
            dependencies: ["ActivityAnimation"]),
    ]
)
