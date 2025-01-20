// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Intelligence",
    platforms: [
      .macOS(.v10_15),
      .iOS(.v15),
      .watchOS(.v6),
      .tvOS(.v13)
    ],
    products: [
        .library(name: "Intelligence", targets: ["Intelligence"]),
    ],
    targets: [
        .target(name: "Intelligence"),
    ]
)
