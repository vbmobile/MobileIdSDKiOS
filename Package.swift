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
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-spm", .exact("4.3.4")),
        .package(name: "VBDependencyInjector", url: "https://github.com/vbmobile/VBDependencyInjector", .exact("1.0.4")),
        .package(name: "VBNetworkClient", url: "https://github.com/vbmobile/VBNetworkClient", .exact("5.1.0")),
        .package(name: "VBImageProcessor", url: "https://github.com/vbmobile/VBImageProcessor", .exact("1.1.2")),
        .package(name: "OCRRFID", url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", from: "7.4.0"),
        .package(name: "DocumentReader", url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "7.4.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileIdSDKiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/MobileIdSDKiOS/MobileIdSDKiOS-7.2.2.zip",
            checksum: "0483010f56a619107213c35a494bcfb915a562ad338504e3ef9d5f3c158290bb"
        ),
        .binaryTarget(
                    name: "Sentry-Dynamic",
                    url: "https://github.com/getsentry/sentry-cocoa/releases/download/8.33.0/Sentry-Dynamic.xcframework.zip",
                    checksum: "4ea23fbc25edb599802f41bb00b4c9da38d1137a75ff0f79d72897d46dd451b9" //Sentry-Dynamic
        ),
        .target(
            name: "MobileIdSDKiOSWrapper",
            dependencies: [
                .target(name: "MobileIdSDKiOS"),
                .target(name: "Sentry-Dynamic"),
                .product(name: "Lottie", package: "Lottie"),
                .product(name: "VBDependencyInjector", package: "VBDependencyInjector"),
                .product(name: "VBNetworkClient", package: "VBNetworkClient"),
                .product(name: "VBImageProcessor", package: "VBImageProcessor"),
                .product(name: "OCRRFID", package: "OCRRFID"),
                .product(name: "DocumentReader", package: "DocumentReader")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
