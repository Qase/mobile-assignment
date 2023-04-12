// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RocketsToolkit",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RocketsToolkit",
            targets: ["RocketsToolkit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Utilities", path: "../../../DomainLayer/Utilities"),
        .package(name: "SharedDomain", path: "../../../DomainLayer/SharedDomain"),
        .package(name: "NetworkProvider", path: "../../Providers/NetworkProvider")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RocketsToolkit",
            dependencies: [
                .product(name: "Utilities", package: "Utilities"),
                .product(name: "SharedDomain", package: "SharedDomain"),
                .product(name: "NetworkProvider", package: "NetworkProvider")
            ]
        ),
        .testTarget(
            name: "RocketsToolkitTests",
            dependencies: ["RocketsToolkit"]),
    ]
)
