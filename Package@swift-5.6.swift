// swift-tools-version:5.6

// Package.swift
//
// Copyright (c) 2014 - 2018 Apple Inc. and the project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.txt for license information:
// https://github.com/apple/swift-protobuf/blob/main/LICENSE.txt
//
// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "IntentSwiftProtobuf",
  products: [
    .executable(name: "protoc-gen-swift", targets: ["protoc-gen-swift"]),
    .library(name: "IntentSwiftProtobuf", targets: ["IntentSwiftProtobuf"]),
    .library(name: "IntentSwiftProtobufPluginLibrary", targets: ["IntentSwiftProtobufPluginLibrary"]),
  ],
  targets: [
    .target(
      name: "IntentSwiftProtobuf"
    ),
    .target(
      name: "IntentSwiftProtobufPluginLibrary",
      dependencies: ["IntentSwiftProtobuf"]
    ),
    .target(
      name: "protoc-gen-swift",
      dependencies: ["IntentSwiftProtobufPluginLibrary", "IntentSwiftProtobuf"]
    ),
    .target(
      name: "Conformance",
      dependencies: ["IntentSwiftProtobuf"]
    ),
    .testTarget(
      name: "IntentSwiftProtobufTests",
      dependencies: ["IntentSwiftProtobuf"]
    ),
    .testTarget(
      name: "IntentSwiftProtobufPluginLibraryTests",
      dependencies: ["IntentSwiftProtobufPluginLibrary"]
    ),
  ],
  swiftLanguageVersions: [.v4, .v4_2, .version("5")]
)
