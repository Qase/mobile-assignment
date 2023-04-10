// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
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
        //.package(path: "../Infrastructure/")
        .package(path: "../Domain/"),
        .package(path: "../Infrastructure/"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
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
