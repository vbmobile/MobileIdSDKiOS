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
            targets: ["MobileIdSDKiOS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/getsentry/sentry-cocoa", .exact("8.32.0")),
        .package(url: "https://github.com/airbnb/lottie-ios.git", .exact("4.3.4")),
        .package(url: "https://github.com/vbmobile/VBDependencyInjector", .exact("1.0.4")),
        .package(url: "https://github.com/vbmobile/VBNetworkClient", .exact("5.1.0")),
        .package(url: "https://github.com/vbmobile/VBImageProcessor", .exact("1.1.2")),
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", from: "7.4.0"),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "7.4.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileIdSDKiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/MobileIdSDKiOS/MobileIdSDKiOS-7.2.1.zip",
            checksum: "709e8beedce6029b439e7d4bb59e1830060b642b96791586c65a6520ca5ba908"
        ),
        .target(
            name: "MobileIdSDKiOSWrapper",
            dependencies: [
                .target(name: "MobileIdSDKiOS"),
                "sentry-cocoa",
                "lottie-ios",
                "VBDependencyInjector",
                "VBNetworkClient",
                "VBImageProcessor",
                "DocumentReaderOCRRFID-Swift-Package",
                "DocumentReader-Swift-Package"
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ],
    swiftLanguageVersions: [.v5]
)