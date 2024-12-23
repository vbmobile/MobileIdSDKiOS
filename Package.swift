// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileIdSDKiOS",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MobileIdSDKiOS",
            targets: ["MobileIdSDKiOSWrapper"]),
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-spm", .exact("4.4.1")),
        .package(name: "VBDependencyInjector", url: "https://github.com/vbmobile/VBDependencyInjector", .exact("1.0.5")),
        .package(name: "VBNetworkClient", url: "https://github.com/vbmobile/VBNetworkClient", .exact("5.1.1")),
        .package(name: "VBImageProcessor", url: "https://github.com/vbmobile/VBImageProcessor", .exact("1.1.3")),
        .package(name: "VBUtils", url: "https://github.com/vbmobile/VBUtils", .exact("1.0.0")),
    ],
    targets: [
        .binaryTarget(
            name: "MobileIdSDKiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/MobileIdSDKiOS/MobileIdSDKiOS-8.0.0.zip",
            checksum: "fa0f05b886aa8229dc7c6494fc16453486392854972b05e04523b8084752937b"
        ),
        .target(
            name: "MobileIdSDKiOSWrapper",
            dependencies: [
                .target(name: "MobileIdSDKiOS"),
                .product(name: "Lottie", package: "Lottie"),
                .product(name: "VBDependencyInjector", package: "VBDependencyInjector"),
                .product(name: "VBNetworkClient", package: "VBNetworkClient"),
                .product(name: "VBImageProcessor", package: "VBImageProcessor"),
                .product(name: "VBUtils", package: "VBUtils")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
