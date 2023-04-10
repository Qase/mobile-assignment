// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreMotionClient",
            targets: ["CoreMotionClient"]),
        .library(
            name: "RocketRepository",
            targets: ["RocketRepository"]),
        .library(
            name: "RocketClient",
            targets: ["RocketClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.9.0"),
        .package(path: "../Infrastructure/"),
        .package(url: "https://github.com/Qase/swift-core", branch: "develop"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoreMotionClient",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .target(
            name: "RocketRepository",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Rocket", package: "Infrastructure"),
                .product(name: "RequestBuilderClient", package: "Infrastructure"),
                .product(name: "APIClient", package: "Infrastructure")
                
            ]),
        
            .target(
                name: "RocketClient",
                dependencies: [
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                    .product(name: "Rocket", package: "Infrastructure"),
                    .product(name: "APIClient", package: "Infrastructure"),
                    .product(name: "RequestBuilderClient", package: "Infrastructure"),
                    .product(name: "Networking", package: "swift-core"),
                    .product(name: "RequestBuilder", package: "swift-core"),
                    .product(name: "NetworkMonitoring", package: "swift-core"),
                    
                ]),
        
        .testTarget(
            name: "RocketClientTests",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Rocket", package: "Infrastructure"),
                .product(name: "Networking", package: "swift-core"),
                .product(name: "RequestBuilder", package: "swift-core"),
                .product(name: "NetworkMonitoring", package: "swift-core"),
                .product(name: "APIClient", package: "Infrastructure"),
                .product(name: "XCTestHelper", package: "Infrastructure"),
                "RocketClient"
            ]
        ),
    ]
)
