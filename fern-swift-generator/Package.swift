// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "TrainTravel",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "TrainTravel",
            targets: ["TrainTravel"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TrainTravel",
            path: "Sources"
        )
    ]
)
