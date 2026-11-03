#if os(macOS)
import Foundation
import KnowledgeCore

public enum AppleFoundationModelError: Error {
    case unavailable
    case executionFailed(String)
}

public protocol CurationModelProtocol {
    func generateSummary(text: String) async throws -> String
    func extractEntities(text: String) async throws -> [String]
}

// In macOS 27 (the target date), FoundationModels framework would provide access to local on-device generative AI.
public actor FoundationModelProvider: CurationModelProtocol {
    public init() {}

    public func generateSummary(text: String) async throws -> String {
        // Stub for `FoundationModels.generate(prompt: ...)`
        return "Stub Summary of: \(text.prefix(50))..."
    }

    public func extractEntities(text: String) async throws -> [String] {
         // Stub for `FoundationModels.generateStructured(schema: ...)`
         return ["Entity_1", "Entity_2"]
    }
}
#endif
