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
        .library(name: "List", targets: ["List"]),

        .library(name: "List Foundation Integration", targets: ["List Foundation Integration"]),
        .library(name: "List Test Support", targets: ["List Test Support"]),
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
            dependencies: [
                .product(name: "Index", package: "swift-index"),
            ],
            path: "Sources/List"
        ),
        
        .target(
            name: "List Foundation Integration",
            dependencies: [
                .target(name: "List"),
            ],
            path: "Sources/List Foundation Integration"
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
                .target(name: "List"),
                .target(name: "List Test Support"),
                .target(name: "List Foundation Integration"),
            ],
            path: "Tests/List Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("RawLayout"),
    ]
}
