// swift-tools-version: 5.9
// Swift Automotive Testing Framework - Detroit Innovation

import PackageDescription

let package = Package(
    name: "SwiftAutomotiveTesting",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .watchOS(.v8),
        .tvOS(.v15)
    ],
    products: [
        .library(name: "AutomotiveTesting", targets: ["AutomotiveTesting"]),
        .library(name: "VehicleSimulator", targets: ["VehicleSimulator"]),
        .library(name: "CarPlayTesting", targets: ["CarPlayTesting"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-testing", from: "0.4.0")
    ],
    targets: [
        .target(
            name: "AutomotiveTesting",
            dependencies: [.product(name: "Testing", package: "swift-testing")]
        ),
        .target(
            name: "VehicleSimulator",
            dependencies: ["AutomotiveTesting"]
        ),
        .target(
            name: "CarPlayTesting",
            dependencies: ["AutomotiveTesting"]
        ),
        .testTarget(
            name: "SwiftAutomotiveTestingTests",
            dependencies: ["AutomotiveTesting", "VehicleSimulator", "CarPlayTesting"]
        )
    ]
)
