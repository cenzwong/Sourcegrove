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
        .library(name: "ImageIntelligence", targets: ["ImageIntelligence"]),
        .library(name: "TextIntelligence", targets: ["TextIntelligence"]),
        .library(name: "Embeddings", targets: ["Embeddings"]),
        .library(name: "KnowledgeCuration", targets: ["KnowledgeCuration"]),
        .library(name: "KnowledgeGraph", targets: ["KnowledgeGraph"]),
        .library(name: "HybridRetrieval", targets: ["HybridRetrieval"]),
        .library(name: "ContextServing", targets: ["ContextServing"]),
        .library(name: "AppleFoundationModels", targets: ["AppleFoundationModels"]),
        .library(name: "MCPIntegration", targets: ["MCPIntegration"]),
        .library(name: "ACPIntegration", targets: ["ACPIntegration"]),
        .library(name: "ConversationProviders", targets: ["ConversationProviders"]),
        .library(name: "Security", targets: ["Security"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "KnowledgeCore", dependencies: [], path: "packages/KnowledgeCore/Sources/KnowledgeCore"),
        .target(name: "LibraryManagement", dependencies: ["KnowledgeCore"], path: "packages/LibraryManagement/Sources/LibraryManagement"),
        .target(name: "SQLiteStore", dependencies: ["KnowledgeCore"], path: "packages/SQLiteStore/Sources/SQLiteStore"),
        .target(name: "SourceDiscovery", dependencies: ["KnowledgeCore"], path: "packages/SourceDiscovery/Sources/SourceDiscovery"),
        .target(name: "ContentExtraction", dependencies: ["KnowledgeCore"], path: "packages/ContentExtraction/Sources/ContentExtraction"),
        .target(name: "ImageIntelligence", dependencies: ["KnowledgeCore"], path: "packages/ImageIntelligence/Sources/ImageIntelligence"),
        .target(name: "TextIntelligence", dependencies: ["KnowledgeCore"], path: "packages/TextIntelligence/Sources/TextIntelligence"),
        .target(name: "Embeddings", dependencies: ["KnowledgeCore"], path: "packages/Embeddings/Sources/Embeddings"),
        .target(name: "KnowledgeCuration", dependencies: ["KnowledgeCore"], path: "packages/KnowledgeCuration/Sources/KnowledgeCuration"),
        .target(name: "KnowledgeGraph", dependencies: ["KnowledgeCore"], path: "packages/KnowledgeGraph/Sources/KnowledgeGraph"),
        .target(name: "HybridRetrieval", dependencies: ["KnowledgeCore", "SQLiteStore", "Embeddings"], path: "packages/HybridRetrieval/Sources/HybridRetrieval"),
        .target(name: "ContextServing", dependencies: ["KnowledgeCore"], path: "packages/ContextServing/Sources/ContextServing"),
        .target(name: "AppleFoundationModels", dependencies: ["KnowledgeCore"], path: "packages/AppleFoundationModels/Sources/AppleFoundationModels"),
        .target(name: "MCPIntegration", dependencies: ["KnowledgeCore"], path: "packages/MCPIntegration/Sources/MCPIntegration"),
        .target(name: "ACPIntegration", dependencies: ["KnowledgeCore"], path: "packages/ACPIntegration/Sources/ACPIntegration"),
        .target(name: "ConversationProviders", dependencies: ["KnowledgeCore"], path: "packages/ConversationProviders/Sources/ConversationProviders"),
        .target(name: "Security", dependencies: [], path: "packages/Security/Sources/Security"),
    ]
)
