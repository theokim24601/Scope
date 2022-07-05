// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Scope",
  platforms: [
    .macOS(.v10_10),
    .iOS(.v9),
    .tvOS(.v9),
    .watchOS(.v2)
  ],
  products: [
    .library(name: "Scope", targets: ["Scope"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Scope"
    ),
    .testTarget(
      name: "ScopeTests",
      dependencies: ["Scope"]
    )
  ],
  swiftLanguageVersions: [.v5]
)
