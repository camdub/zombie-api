import PackageDescription

let package = Package(
    name: "Vapor",
    targets: [
        Target(name: "App"),
        Target(name: "Run", dependencies: ["App"])
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/vapor/leaf-provider.git", majorVersion: 1),
        .Package(url: "https://github.com/OpenKitten/Meow.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/GraphQLSwift/GraphQL.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/GraphQLSwift/Graphiti.git", majorVersion: 0, minor: 3)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources"
    ]
)
