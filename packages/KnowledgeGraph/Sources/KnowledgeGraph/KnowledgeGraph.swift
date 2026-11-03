import Foundation
import KnowledgeCore

public protocol KnowledgeGraphServiceProtocol {
    func addRelationship(_ relationship: Relationship) async throws
    func getRelatedConcepts(to conceptID: ConceptID, type: RelationshipType?) async throws -> [ConceptID]
}

public actor KnowledgeGraphService: KnowledgeGraphServiceProtocol {
    private var relationships: [Relationship] = []

    public init() {}

    public func addRelationship(_ relationship: Relationship) async throws {
        relationships.append(relationship)
    }

    public func getRelatedConcepts(to conceptID: ConceptID, type: RelationshipType? = nil) async throws -> [ConceptID] {
        let matching = relationships.filter {
            ($0.sourceID == conceptID.rawValue || $0.targetID == conceptID.rawValue) &&
            (type == nil || $0.type == type)
        }

        return matching.map { rel in
            if rel.sourceID == conceptID.rawValue {
                return ConceptID(rawValue: rel.targetID)
            } else {
                return ConceptID(rawValue: rel.sourceID)
            }
        }
    }
}
