// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileIdSDKiOS",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MobileIdSDKiOS",
            targets: ["MobileIdSDKiOSWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm", .exact("4.4.1")),
        .package(url: "https://github.com/vbmobile/VBDependencyInjector", .exact("1.0.5")),
        .package(url: "https://github.com/vbmobile/VBNetworkClient", .exact("5.1.1")),
        .package(url: "https://github.com/vbmobile/VBImageProcessor", .exact("1.2.2")),
        .package(url: "https://github.com/vbmobile/VBUtils", .exact("2.0.2")),
        .package(url: "https://github.com/vbmobile/matomo-sdk-ios", .exact("7.7.0")),
    ],
    targets: [
        .binaryTarget(
            name: "MobileIdSDKiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/MobileIdSDKiOS/MobileIdSDKiOS-8.1.3.zip",
            checksum: "a48e168f2fd99fb652c2bc0da53d9598904fdef68988e693fdd611313ffc9c1d"
        ),
        .target(
            name: "MobileIdSDKiOSWrapper",
            dependencies: [
                .target(name: "MobileIdSDKiOS"),
                .product(name: "Lottie", package: "lottie-spm"),
                .product(name: "VBDependencyInjector", package: "VBDependencyInjector"),
                .product(name: "VBNetworkClient", package: "VBNetworkClient"),
                .product(name: "VBImageProcessor", package: "VBImageProcessor"),
                .product(name: "MatomoTracker", package: "matomo-sdk-ios"),
                .product(name: "VBUtils", package: "VBUtils")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
