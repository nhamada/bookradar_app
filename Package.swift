// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "bookradar_app",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BookRadarApp",
            targets: [
                "BookRadarApp",
                "BookRadarEntity",
                "APIClient",
                "GoogleBooksRepository",
            ]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BookRadarApp"
        ),
        .target(
            name: "BookRadarEntity"
        ),
        .target(
            name: "APIClient"
        ),
        .target(
            name: "BooksRepository",
            dependencies: [
                "BookRadarEntity",
            ]
        ),
        .target(
            name: "GoogleBooksRepository",
            dependencies: [
                "APIClient",
                "BooksRepository",
                "BookRadarEntity",
            ]
        ),
        .testTarget(
            name: "BookRadarAppTests",
            dependencies: [
                "BookRadarApp",
            ]
        ),
        .testTarget(
            name: "GoogleBooksDecodingTests",
            dependencies: [
                "BookRadarEntity",
            ],
            resources: [
                .copy("Resources/isbn-9784059200208.json"),
                .copy("Resources/isbn-9784140887196.json"),
                .copy("Resources/isbn-9784327453053.json"),
            ]
        ),
        .testTarget(
            name: "GoogleBooksRepositoryTests",
            dependencies: [
                "BookRadarEntity",
                "APIClient",
                "GoogleBooksRepository",
            ]
        )
    ]
)
