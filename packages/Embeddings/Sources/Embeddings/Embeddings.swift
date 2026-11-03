#if os(macOS)
import Foundation
import KnowledgeCore
import NaturalLanguage

public enum EmbeddingError: Error {
    case modelNotAvailable
    case generationFailed(String)
}

public protocol EmbeddingProviderProtocol: Sendable {
    var modelIdentifier: String { get }
    var dimension: Int { get }
    func generateEmbedding(for text: String) async throws -> [Float]
}

@available(macOS 14.0, *)
public actor NLEmbeddingProvider: EmbeddingProviderProtocol {
    public let modelIdentifier: String = "NLEmbedding-Sentence"
    public let dimension: Int = 512 // Estimated for default sentence embedding

    public init() {}

    public func generateEmbedding(for text: String) async throws -> [Float] {
        // NaturalLanguage framework provides NLEmbedding
        // Fallback for older APIs or custom context if needed
        guard let embedding = NLEmbedding.sentenceEmbedding(for: .english) else {
            throw EmbeddingError.modelNotAvailable
        }

        // This is a simplified representation.
        // In real usage, you calculate vector components based on word/sentence features
        if let vector = embedding.vector(for: text) {
            return vector.map { Float($0) }
        } else {
            throw EmbeddingError.generationFailed("Could not generate vector.")
        }
    }
}
#endif
