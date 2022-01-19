// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TaskManagerAppKit",
    platforms: [
      .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TaskManagerAppKit",
            targets: ["TaskManagerAppKit"]),
        .library(
            name: "Models",
            targets: ["Models"]),
        .library(name: "AppCore", targets: ["AppCore"]),
        .library(name: "ProjectsCore", targets: ["ProjectsCore"]),
        .library(name: "TasksCore", targets: ["TasksCore"])

    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "0.9.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TaskManagerAppKit",
            dependencies: []),
        .testTarget(
            name: "TaskManagerAppKitTests",
            dependencies: ["TaskManagerAppKit"]),
        .target(
            name: "Models",
            dependencies: []
        ),
        .target(
            name: "AppCore",
            dependencies: ["Models",
                           "ProjectsCore",
                           "TasksCore",
                            .product(name: "ComposableArchitecture",
                                              package: "swift-composable-architecture")]
        ),
        .target(
            name: "ProjectsCore",
            dependencies: ["Models",
                            .product(name: "ComposableArchitecture",
                                              package: "swift-composable-architecture")]
        ),
        .testTarget(
            name: "ProjectsCoreTests",
            dependencies: ["ProjectsCore", "AppCore"]),
        .target(
            name: "TasksCore",
            dependencies: ["Models",
                            .product(name: "ComposableArchitecture",
                                              package: "swift-composable-architecture")]
        ),
        .testTarget(
            name: "TasksCoreTests",
            dependencies: ["TasksCore", "AppCore"])
    ]
)
