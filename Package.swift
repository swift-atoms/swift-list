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
            name: "List Index",
            targets: ["List Index"]
        ),

        .library(
            name: "List",
            targets: ["List"]
        ),
        .library(
            name: "List Test Support",
            targets: ["List Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-index.git",
            branch: "main"
        )
    ],
    targets: [

        .target(
            name: "List",
            dependencies: []
        ),

        .target(
            name: "List Index",
            dependencies: [
                .target(name: "List"),
                .product(name: "Index", package: "swift-index"),
            ]
        ),

        .target(
            name: "List Test Support",
            dependencies: [
                .target(name: "List"),
                .product(name: "Index Test Support", package: "swift-index"),
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "List Tests",
            dependencies: [
                .target(name: "List")
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
