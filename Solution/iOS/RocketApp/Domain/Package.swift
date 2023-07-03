// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Domain",
  platforms: [.iOS(.v15), .macOS(.v12)],

  products: [
    .library(
      name: "RocketsClient",
      targets: ["RocketsClient"]
    )
  ],

  dependencies: [
    .package(path: "../Infrastructure"),
    .package(url: "https://github.com/Qase/swift-core", branch: "develop"),
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "0.1.4"),
    .package(url: "https://github.com/rickclephas/KMP-NativeCoroutines.git", branch: "master"),
    .package(url: "https://github.com/Qase/mobile-assignment-kmm.git", branch: "main")
  ],

  targets: [
    .target(
      name: "RocketsClient",
      dependencies: [
        .product(name: "CoreToolkit", package: "Infrastructure"),
        .product(name: "UIToolkit", package: "Infrastructure"),
        .product(name: "NetworkClientExtensions", package: "Infrastructure"),
        .product(name: "ErrorReporting", package: "swift-core"),
        .product(name: "ModelConvertible", package: "swift-core"),
        .product(name: "Networking", package: "swift-core"),
        .product(name: "RequestBuilder", package: "swift-core"),
        .product(name: "Dependencies", package: "swift-dependencies"),
        .product(name: "fetchRockets", package: "mobile-assignment-kmm"),
        .product(name: "KMPNativeCoroutinesCore", package: "KMP-NativeCoroutines"),
        .product(name: "KMPNativeCoroutinesAsync", package: "KMP-NativeCoroutines")
      ]
    ),
    .testTarget(
      name: "RocketsClientTests",
      dependencies: ["RocketsClient"]
    )
  ]
)
