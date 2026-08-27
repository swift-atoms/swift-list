// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-list",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "List",
            targets: ["List"]
        ),
        .library(
            name: "List Standard Library Integration",
            targets: ["List Standard Library Integration"]
        ),
        .library(
            name: "List Apple Foundation Integration",
            targets: ["List Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "List",
            dependencies: []
        ),
        .target(
            name: "List Standard Library Integration",
            dependencies: ["List"]
        ),
        .target(
            name: "List Apple Foundation Integration",
            dependencies: [
                "List",
                "List Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "List Tests",
            dependencies: [
                "List"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = [
        .enableExperimentalFeature("RawLayout")
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
