// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "Sourcegrove",
    platforms: [
        .macOS(.v27)
    ],
    products: [
        .library(name: "KnowledgeCore", targets: ["KnowledgeCore"]),
        .library(name: "LibraryManagement", targets: ["LibraryManagement"]),
        .library(name: "SQLiteStore", targets: ["SQLiteStore"]),
        .library(name: "SourceDiscovery", targets: ["SourceDiscovery"]),
        .library(name: "ContentExtraction", targets: ["ContentExtraction"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "KnowledgeCore", dependencies: [], path: "packages/KnowledgeCore/Sources/KnowledgeCore"),
        .target(name: "LibraryManagement", dependencies: ["KnowledgeCore"], path: "packages/LibraryManagement/Sources/LibraryManagement"),
        .target(name: "SQLiteStore", dependencies: ["KnowledgeCore"], path: "packages/SQLiteStore/Sources/SQLiteStore"),
        .target(name: "SourceDiscovery", dependencies: ["KnowledgeCore"], path: "packages/SourceDiscovery/Sources/SourceDiscovery"),
        .target(name: "ContentExtraction", dependencies: ["KnowledgeCore"], path: "packages/ContentExtraction/Sources/ContentExtraction"),
    ]
)
