// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "Scope",
  platforms: [
    .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
  ],
  products: [
    .library(name: "Scope", targets: ["Scope"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Scope",
      path: "Scope/Classes",
      exclude: [
        "Scope.h",
      ]
    )
  ],
  swiftLanguageVersions: [.v5]
)
