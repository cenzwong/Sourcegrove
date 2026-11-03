#if os(macOS)
import Foundation
import KnowledgeCore
import NaturalLanguage

public enum TextIntelligenceError: Error {
    case languageIdentificationFailed
    case unsupportedLanguage
}

public struct TextIntelligenceResult {
    public let sourceID: SourceID
    public let primaryLanguage: String
    public let tags: [String]
    public let tokens: [String]
}

public protocol TextIntelligenceServiceProtocol {
    func analyzeText(_ text: String, sourceID: SourceID) async throws -> TextIntelligenceResult
}

public actor TextIntelligenceService: TextIntelligenceServiceProtocol {
    public init() {}

    public func analyzeText(_ text: String, sourceID: SourceID) async throws -> TextIntelligenceResult {
        // 1. Language Identification
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(text)

        guard let language = recognizer.dominantLanguage else {
            throw TextIntelligenceError.languageIdentificationFailed
        }

        // 2. Tokenization
        var tokens: [String] = []
        let tokenizer = NLTokenizer(unit: .word)
        tokenizer.string = text
        tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            tokens.append(String(text[tokenRange]))
            return true
        }

        // 3. Named Entity Recognition (Tags)
        var tags: [String] = []
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = text

        let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
        let range = text.startIndex..<text.endIndex

        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange in
            if let tag = tag, (tag == .personalName || tag == .organizationName || tag == .placeName) {
                tags.append(String(text[tokenRange]))
            }
            return true
        }

        return TextIntelligenceResult(
            sourceID: sourceID,
            primaryLanguage: language.rawValue,
            tags: tags,
            tokens: tokens
        )
    }
}
#endif
