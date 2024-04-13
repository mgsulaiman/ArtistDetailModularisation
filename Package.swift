// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
private let analyticsInterface = "AnalyticsInterface"
private let commonModels = "CommonModels"
private let dependencyContainer = "DependencyContainer"
private let utilities = "Utilities"
private let artistDetailInterface = "ArtistDetailInterface"
private let temporaryMainPackageInterface = "TemporaryMainPackageInterface"
private let songDetailsInterface = "SongDetailsInterface"
let package = Package(
    name: "ArtistDetail",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ArtistDetail",
            targets: ["ArtistDetail"]),
    ],
    dependencies: [
        .package(name: analyticsInterface, path: "../../../Analytics/\(analyticsInterface)"),
        .package(name: commonModels, path: "../../../\(commonModels)"),
        .package(name: dependencyContainer, path: "../../../\(dependencyContainer)"),
        .package(name: utilities, path: "../../../\(utilities)"),
        .package(name: artistDetailInterface, path: "../../../Modules/ArtistDetail/\(artistDetailInterface)"),
        .package(name: temporaryMainPackageInterface, path: "../../../\(temporaryMainPackageInterface)"),
        .package(name: songDetailsInterface, path: "../../SongDetails/\(songDetailsInterface)")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ArtistDetail",
            dependencies: [
                .product(name: analyticsInterface, package: analyticsInterface),
                .product(name: commonModels, package: commonModels),
                .product(name: dependencyContainer, package: dependencyContainer),
                .product(name: utilities, package: utilities),
                .product(name: artistDetailInterface, package: artistDetailInterface),
                .product(name: temporaryMainPackageInterface, package: temporaryMainPackageInterface),
                .product(name: songDetailsInterface, package: songDetailsInterface)
            ]),
        .testTarget(
            name: "ArtistDetailTests",
            dependencies: ["ArtistDetail"]),
    ]
)
