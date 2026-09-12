// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AkharaApp",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "AkharaApp",
            targets: ["AkharaApp"]
        ),
    ],
    targets: [
        .target(
            name: "AkharaApp",
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
