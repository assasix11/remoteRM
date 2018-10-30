// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "VaporToolbox",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/tanner0101/swift-syntax", .branch("static")),
    ],
    targets: [
        // All of the commands and logic that powers the Vapor toolbox
        .target(name: "VaporToolbox", dependencies: [
            "LinuxTestsGeneration",
            "Vapor",
            "Cloud"
        ]),
        .target(name: "LinuxTestsGeneration", dependencies: [
            "SwiftSyntax",
        ]),
        .target(name: "Cloud", dependencies: [
            "Vapor"
        ]),
        .testTarget(name: "LinuxTestsGenerationTests", dependencies: [
            "LinuxTestsGeneration",
        ]),
        // Runnable module, executes the main command group.
        .target(name: "Executable", dependencies: ["VaporToolbox"]),
    ]
)
