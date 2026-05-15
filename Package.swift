// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileIdSDKiOS",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MobileIdSDKiOS",
            targets: ["MobileIdSDKiOSWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm", .exact("4.4.1")),
        .package(url: "https://github.com/vbmobile/VBDependencyInjector", .exact("1.0.7")),
        .package(url: "https://github.com/vbmobile/VBNetworkClient", .exact("5.1.1")),
        .package(url: "https://github.com/vbmobile/VBImageProcessor", .exact("1.2.2")),
        .package(url: "https://github.com/vbmobile/VBUtils", .exact("2.0.2")),
        .package(url: "https://github.com/vbmobile/matomo-sdk-ios", .exact("7.7.0")),
        .package(url: "https://github.com/vbmobile/AMADocModeliOS",
                 .upToNextMinor(from: "1.0.0")),
    ],
    targets: [
        .binaryTarget(
            name: "MobileIdSDKiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/MobileIdSDKiOS/MobileIdSDKiOS-9.1.0.zip",
            checksum: "36d1127c31e1ef659b199c5c1f2ec64a0cecd8276edd4f97003ed7768c644fa1"
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
                .product(name: "VBUtils", package: "VBUtils"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
