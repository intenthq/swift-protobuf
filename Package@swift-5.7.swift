// swift-tools-version:5.6

// Package@swift-5.7.swift
//
// Forked from SwiftProtobuf.
// Module renamed to JedAIProtobuf to avoid symbol conflicts.
//

import PackageDescription

let package = Package(
  name: "JedAIProtobuf",
  products: [
    .executable(name: "protoc-gen-swift", targets: ["protoc-gen-swift"]),
    .library(name: "JedAIProtobuf", targets: ["JedAIProtobuf"]),
    .library(name: "JedAIProtobufPluginLibrary", targets: ["JedAIProtobufPluginLibrary"]),
    .plugin(
        name: "SwiftProtobufPlugin",
        targets: ["SwiftProtobufPlugin"]
    ),
  ],
  targets: [
    .target(
      name: "JedAIProtobuf",
      path: "Sources/SwiftProtobuf"
    ),
    .target(
      name: "JedAIProtobufPluginLibrary",
      dependencies: ["JedAIProtobuf"],
      path: "Sources/SwiftProtobufPluginLibrary"
    ),
    .executableTarget(
      name: "protoc-gen-swift",
      dependencies: ["JedAIProtobufPluginLibrary", "JedAIProtobuf"]
    ),
    .executableTarget(
      name: "Conformance",
      dependencies: ["JedAIProtobuf"]
    ),
    .plugin(
        name: "SwiftProtobufPlugin",
        capability: .buildTool(),
        dependencies: [
            "protoc-gen-swift"
        ]
    ),
    .testTarget(
      name: "JedAIProtobufTests",
      dependencies: ["JedAIProtobuf"],
      path: "Tests/SwiftProtobufTests"
    ),
    .testTarget(
      name: "JedAIProtobufPluginLibraryTests",
      dependencies: ["JedAIProtobufPluginLibrary"],
      path: "Tests/SwiftProtobufPluginLibraryTests"
    ),
  ],
  swiftLanguageVersions: [.v4, .v4_2, .version("5")]
)
