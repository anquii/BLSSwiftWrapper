# BLSSwiftWrapper

[![Platform](https://img.shields.io/badge/Platforms-macOS%20%7C%20iOS-blue)](#platforms)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-orange)](#swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/anquii/BLSSwiftWrapper/blob/main/LICENSE)

A Swift package wrapper of [herumi/bls](https://github.com/herumi/bls) in binary form (via an `XCFramework` bundle). The wrapper is necessary for multiple targets to depend on the binary through [Swift Package Manager](https://www.swift.org/package-manager), as only one binary target can be defined for it within a dependency graph. The release versions of this package mirrors the ones of [herumi/bls](https://github.com/herumi/bls) starting from [v1.24](https://github.com/herumi/bls/releases/tag/v1.24).

## Platforms
- macOS 10.15+
- iOS 13+

## Installation

### Swift Package Manager

Add the following lines to your `Package.swift` file:
```swift
.package(url: "https://github.com/anquii/MCLSwiftWrapper.git", .exact("1.61.1"),
.package(url: "https://github.com/anquii/BLSSwiftWrapper.git", .exact("1.24.1")
```
...or integrate with Xcode via `File -> Swift Packages -> Add Package Dependency...` using the repository URLs from the lines above.

## License

`BLSSwiftWrapper` is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file for more information.

## Acknowledgments

In developing `BLSSwiftWrapper`, [MyEtherWallet](https://github.com/MyEtherWallet)'s [bls-eth-swift](https://github.com/MyEtherWallet/bls-eth-swift) has been used as a reference implementation.
