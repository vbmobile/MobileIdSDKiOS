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
        .package(name: "VBDependencyInjector", url: "https://github.com/vbmobile/VBDependencyInjector", .exact("1.0.5")),
        .package(name: "VBNetworkClient", url: "https://github.com/vbmobile/VBNetworkClient", .exact("5.1.0")),
        .package(name: "VBImageProcessor", url: "https://github.com/vbmobile/VBImageProcessor", .exact("1.1.2")),
        .package(name: "OCRRFID", url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", from: "7.4.0"),
        .package(name: "DocumentReader", url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "7.4.0"),
    ],
    targets: [
        .binaryTarget(
            name: "MobileIdSDKiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/MobileIdSDKiOS/MobileIdSDKiOS/MobileIdSDKiOS-7.3.1.zip",
            checksum: "a7c04f01ef23801071d518c016b0ae8d1084992dd582b20d7b1111e5f2f2e65e"
        ),
        .target(
            name: "MobileIdSDKiOSWrapper",
            dependencies: [
                .target(name: "MobileIdSDKiOS"),
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
