// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Features",
  platforms: [.iOS(.v16), .macOS(.v12)],

  products: [
    .library(
      name: "RocketDetail",
      targets: ["RocketDetail"]
    ),
    .library(
      name: "RocketLaunch",
      targets: ["RocketLaunch"]
    ),
    .library(
      name: "RocketList",
      targets: ["RocketList"]
    ),
    .library(
      name: "RocketListCell",
      targets: ["RocketListCell"]
    )
  ],

  dependencies: [
    .package(path: "../Domain"),
    .package(path: "../Infrastructure"),
    .package(url: "https://github.com/pointfreeco/swift-tagged", .upToNextMajor(from: "0.1.0")),
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.5.0"),
    .package(url: "https://github.com/pointfreeco/composable-core-motion", from: "0.1.0")
  ],

  targets: [
    .target(
      name: "RocketDetail",
      dependencies: [
        "RocketLaunch",
        .product(name: "RocketsClient", package: "Domain"),
        .product(name: "CoreToolkit", package: "Infrastructure"),
        .product(name: "UIToolkit", package: "Infrastructure"),
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .testTarget(
      name: "RocketDetailTests",
      dependencies: ["RocketDetail"]
    ),
    .target(
      name: "RocketLaunch",
      dependencies: [
        .product(name: "RocketsClient", package: "Domain"),
        .product(name: "MotionClient", package: "Infrastructure"),
        .product(name: "UIToolkit", package: "Infrastructure"),
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        .product(name: "ComposableCoreMotion", package: "composable-core-motion")
      ]
    ),
    .testTarget(
      name: "RocketLaunchTests",
      dependencies: ["RocketLaunch"]
    ),
    .target(
      name: "RocketList",
      dependencies: [
        "RocketListCell",
        "RocketDetail",
        .product(name: "RocketsClient", package: "Domain"),
        .product(name: "CoreToolkit", package: "Infrastructure"),
        .product(name: "UIToolkit", package: "Infrastructure"),
        .product(name: "NetworkClientExtensions", package: "Infrastructure"),
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .testTarget(
      name: "RocketListTests",
      dependencies: ["RocketList"]
    ),
    .target(
      name: "RocketListCell",
      dependencies: [
        .product(name: "RocketsClient", package: "Domain"),
        .product(name: "CoreToolkit", package: "Infrastructure"),
        .product(name: "UIToolkit", package: "Infrastructure"),
        .product(name: "Tagged", package: "swift-tagged"),
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .testTarget(
      name: "RocketListCellTests",
      dependencies: ["RocketListCell"]
    )
  ]
)
