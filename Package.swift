// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "BLSSwiftWrapper",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BLSSwiftWrapper",
            targets: ["BLSSwiftWrapper"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "BLSSwiftWrapper",
            url: "https://github.com/anquii/BLSSwiftWrapper/releases/download/v1.24.0/BLSSwiftWrapper.zip",
            checksum: ""
        )
    ]
)
