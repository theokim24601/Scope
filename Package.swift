// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "Scope",
  platforms: [ .iOS(.v8) ],
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
