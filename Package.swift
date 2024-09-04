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
        //.package(name: "sentry-cocoa", url: "https://github.com/getsentry/sentry-cocoa", .exact("8.32.0")),
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
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/MobileIdSDKiOS/MobileIdSDKiOS-7.2.1.zip",
            checksum: "709e8beedce6029b439e7d4bb59e1830060b642b96791586c65a6520ca5ba908"
        ),
        .binaryTarget(
            name: "Sentry",
            url: "https://github.com/getsentry/sentry-cocoa/releases/download/8.32.0/Sentry.xcframework.zip",
            checksum: "780558374b95d370e8b604097f9ccb2cac328fdd18c4b8542a58ece83d2548d2" //Sentry-Static
        ),
        .target(
            name: "MobileIdSDKiOSWrapper",
            dependencies: [
                .target(name: "MobileIdSDKiOS"),
                .product(name: "Sentry", package: "Sentry"),
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
