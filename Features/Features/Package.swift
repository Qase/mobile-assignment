// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "RocketLaunch",
            targets: ["RocketLaunch"]),
        .library(
            name: "RocketDetail",
            targets: ["RocketDetail"]),
        .library(
            name: "RocketList",
            targets: ["RocketList"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.9.0"),
        .package(path: "../Domain/"),
        .package(path: "../Infrastructure/"),
    ],
    targets: [
        .target(
            name: "RocketLaunch",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "CoreMotionClient", package: "Domain"),
            ]
        ),
        .target(
            name: "RocketDetail",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Rocket", package: "Infrastructure"),
                "RocketLaunch",
            ]
        ),
        .target(
            name: "RocketList",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Rocket", package: "Infrastructure"),
                .product(name: "RocketClient", package: "Domain"),
                "RocketDetail",
            ]
        ),
        .testTarget(
            name: "RocketDomainTests",
            dependencies: [
                "RocketList",
                "RocketDetail",
                "RocketLaunch",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Rocket", package: "Infrastructure"),
                .product(name: "RocketClient", package: "Domain"),
                .product(name: "CoreMotionClient", package: "Domain"),
            ]
        ),
    ]
)
