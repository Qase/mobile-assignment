// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Infrastructure",
  defaultLocalization: "en",
  platforms: [.iOS(.v15), .macOS(.v12)],

  products: [
    .library(
      name: "CoreToolkit",
      targets: ["CoreToolkit"]
    ),
    .library(
      name: "MotionClient",
      targets: ["MotionClient"]
    ),
    .library(
      name: "NetworkClientExtensions",
      targets: ["NetworkClientExtensions"]
    ),
    .library(
      name: "TCAExtensions",
      targets: ["TCAExtensions"]
    ),
    .library(
      name: "UIToolkit",
      targets: ["UIToolkit"]
    )
  ],

  dependencies: [
    .package(url: "https://github.com/Qase/swift-core", branch: "develop"),
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "0.1.4"),
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.5.0"),
    .package(url: "https://github.com/pointfreeco/composable-core-motion", from: "0.1.0")
  ],

  targets: [
    .target(
      name: "CoreToolkit",
      dependencies: []
    ),
    .testTarget(
      name: "CoreToolkitTests",
      dependencies: ["CoreToolkit"]
    ),
    .target(
      name: "MotionClient",
      dependencies: [
        .product(name: "ComposableCoreMotion", package: "composable-core-motion"),
        .product(name: "Dependencies", package: "swift-dependencies")
      ]
    ),
    .target(
      name: "NetworkClientExtensions",
      dependencies: [
        .product(name: "Networking", package: "swift-core"),
        .product(name: "Dependencies", package: "swift-dependencies")
      ]
    ),
    .target(
      name: "TCAExtensions",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .testTarget(
      name: "TCAExtensionsTests",
      dependencies: ["TCAExtensions"]
    ),
    .target(
      name: "UIToolkit",
      dependencies: []
    ),
    .testTarget(
      name: "UIToolkitTests",
      dependencies: ["UIToolkit"]
    )
  ]
)
