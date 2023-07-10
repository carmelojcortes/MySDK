// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let core: Target = .target(
    name: "MySDKCore",
    dependencies: [],
    exclude: [
        "Stuff/file.json",
        "Stuff/script.sh"
    ]
)

let ui: Target = .target(
    name: "MySDKUI",
    dependencies: [
        "MySDKCore",
        .product(name: "Nuke", package: "Nuke"),
        .product(name: "NukeUI", package: "Nuke")
    ],
    resources: [.process("Resources/Haptics")]
)

let package = Package(
    name: "MySDK",
    defaultLocalization: "en",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "MySDKCore",
            targets: ["MySDKCore"]
        ),
        .library(
            name: "MySDKUI",
            targets: ["MySDKUI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke", .upToNextMajor(from: "12.1.0"))
    ],
    targets: [core, ui]
)
