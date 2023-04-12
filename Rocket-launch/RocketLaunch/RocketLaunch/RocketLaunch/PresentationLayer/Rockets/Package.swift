// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rockets",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Rockets",
            targets: ["Rockets"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "UIToolkit", path: "../UIToolkit"),
        .package(name: "Utilities", path: "../../DomainLayer/Utilities"),
        .package(name: "SharedDomain", path: "../../DomainLayer/SharedDomain"),
        .package(url: "https://github.com/hmlongco/Resolver.git", .upToNextMajor(from: "1.0.0")),
        .package(name: "RocketDetail", path: "./RocketDetail")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Rockets",
            dependencies: [
                .product(name: "UIToolkit", package: "UIToolkit"),
                .product(name: "Utilities", package: "Utilities"),
                .product(name: "SharedDomain", package: "SharedDomain"),
                .product(name: "Resolver", package: "Resolver"),
                .product(name: "RocketDetail", package: "RocketDetail")
            ]
        ),
        .testTarget(
            name: "RocketsTests",
            dependencies: ["Rockets"]
        ),
    ]
)
