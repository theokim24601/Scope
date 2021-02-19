// swift-tools-version:5.0

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
      name: "Scope",
      path: "Source"
    ),
    .testTarget(
      name: "ScopeTests",
      dependencies: ["Scope"],
      path: "Tests"
    )
  ],
  swiftLanguageVersions: [.v5]
)
