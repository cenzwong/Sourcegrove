import Foundation

public struct LibraryID: Hashable, Equatable, RawRepresentable {
    public let rawValue: UUID
    public init(rawValue: UUID) { self.rawValue = rawValue }
    public init() { self.rawValue = UUID() }
}

public struct SourceID: Hashable, Equatable, RawRepresentable {
    public let rawValue: UUID
    public init(rawValue: UUID) { self.rawValue = rawValue }
    public init() { self.rawValue = UUID() }
}

public struct SourceVersion: Hashable, Equatable, RawRepresentable {
    public let rawValue: String
    public init(rawValue: String) { self.rawValue = rawValue }
}

public struct ConceptID: Hashable, Equatable, RawRepresentable {
    public let rawValue: UUID
    public init(rawValue: UUID) { self.rawValue = rawValue }
    public init() { self.rawValue = UUID() }
}

public struct ClaimID: Hashable, Equatable, RawRepresentable {
    public let rawValue: UUID
    public init(rawValue: UUID) { self.rawValue = rawValue }
    public init() { self.rawValue = UUID() }
}

public struct EvidenceID: Hashable, Equatable, RawRepresentable {
    public let rawValue: UUID
    public init(rawValue: UUID) { self.rawValue = rawValue }
    public init() { self.rawValue = UUID() }
}

public struct Library: Equatable {
    public let id: LibraryID
    public let name: String
    public let rootURL: URL

    public init(id: LibraryID = LibraryID(), name: String, rootURL: URL) {
        self.id = id
        self.name = name
        self.rootURL = rootURL
    }
}

public struct Source: Equatable {
    public let id: SourceID
    public let libraryID: LibraryID
    public let relativePath: String
    public let currentVersion: SourceVersion

    public init(id: SourceID = SourceID(), libraryID: LibraryID, relativePath: String, currentVersion: SourceVersion) {
        self.id = id
        self.libraryID = libraryID
        self.relativePath = relativePath
        self.currentVersion = currentVersion
    }
}

public struct Claim: Equatable {
    public let id: ClaimID
    public let statement: String
    public let subject: String
    public let predicate: String
    public let object: String
    public let evidenceIDs: [EvidenceID]

    public init(id: ClaimID = ClaimID(), statement: String, subject: String, predicate: String, object: String, evidenceIDs: [EvidenceID]) {
        self.id = id
        self.statement = statement
        self.subject = subject
        self.predicate = predicate
        self.object = object
        self.evidenceIDs = evidenceIDs
    }
}

public struct KnowledgeConcept: Equatable {
    public let id: ConceptID
    public let title: String
    public let definition: String
    public let claimIDs: [ClaimID]

    public init(id: ConceptID = ConceptID(), title: String, definition: String, claimIDs: [ClaimID]) {
        self.id = id
        self.title = title
        self.definition = definition
        self.claimIDs = claimIDs
    }
}

public enum RelationshipType: String, Equatable {
    case relatedTo = "related_to"
    case mentions = "mentions"
    case supports = "supports"
    case contradicts = "contradicts"
}

public struct Relationship: Equatable {
    public let id: UUID
    public let sourceID: UUID
    public let targetID: UUID
    public let type: RelationshipType
    public let evidenceIDs: [EvidenceID]

    public init(id: UUID = UUID(), sourceID: UUID, targetID: UUID, type: RelationshipType, evidenceIDs: [EvidenceID]) {
        self.id = id
        self.sourceID = sourceID
        self.targetID = targetID
        self.type = type
        self.evidenceIDs = evidenceIDs
    }
}
