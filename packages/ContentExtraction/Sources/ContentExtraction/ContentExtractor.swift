import Foundation
import KnowledgeCore

public struct ExtractedDocument {
    public let sourceID: SourceID
    public let textContent: String
    public let chunks: [ContentChunk]
}

public struct ContentChunk {
    public let text: String
    public let startIndex: Int
    public let endIndex: Int
}

public protocol ContentExtractorProtocol {
    func canHandle(url: URL) -> Bool
    func extract(url: URL, sourceID: SourceID) async throws -> ExtractedDocument
}

public class ExtractionRouter {
    private var extractors: [ContentExtractorProtocol] = []

    public init() {}

    public func register(extractor: ContentExtractorProtocol) {
        extractors.append(extractor)
    }

    public func extract(url: URL, sourceID: SourceID) async throws -> ExtractedDocument {
        guard let extractor = extractors.first(where: { $0.canHandle(url: url) }) else {
            throw NSError(domain: "ExtractionRouter", code: 1, userInfo: [NSLocalizedDescriptionKey: "No extractor found for file type"])
        }
        return try await extractor.extract(url: url, sourceID: sourceID)
    }
}

// PDF Extractor stub
public class PDFExtractor: ContentExtractorProtocol {
    public init() {}

    public func canHandle(url: URL) -> Bool {
        return url.pathExtension.lowercased() == "pdf"
    }

    public func extract(url: URL, sourceID: SourceID) async throws -> ExtractedDocument {
        // Here we would use PDFKit to parse text, pages, bounds
        return ExtractedDocument(sourceID: sourceID, textContent: "Stub PDF Content", chunks: [])
    }
}
