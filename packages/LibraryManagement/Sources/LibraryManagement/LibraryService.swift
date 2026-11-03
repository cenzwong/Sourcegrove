import Foundation
import KnowledgeCore

public enum LibraryError: Error {
    case libraryNotFound
    case overlapDetected
    case accessDenied
}

public protocol LibraryServiceProtocol {
    func createLibrary(name: String, rootURL: URL) async throws -> Library
    func getLibrary(id: LibraryID) async throws -> Library
    func listLibraries() async throws -> [Library]
    func removeLibrary(id: LibraryID) async throws
}

public actor LibraryManager: LibraryServiceProtocol {
    private var libraries: [LibraryID: Library] = [:]

    public init() {}

    public func createLibrary(name: String, rootURL: URL) async throws -> Library {
        // Basic overlap check
        for existing in libraries.values {
            if existing.rootURL.path.hasPrefix(rootURL.path) || rootURL.path.hasPrefix(existing.rootURL.path) {
                throw LibraryError.overlapDetected
            }
        }

        let library = Library(name: name, rootURL: rootURL)
        libraries[library.id] = library
        return library
    }

    public func getLibrary(id: LibraryID) async throws -> Library {
        guard let library = libraries[id] else {
            throw LibraryError.libraryNotFound
        }
        return library
    }

    public func listLibraries() async throws -> [Library] {
        return Array(libraries.values)
    }

    public func removeLibrary(id: LibraryID) async throws {
        guard libraries[id] != nil else {
            throw LibraryError.libraryNotFound
        }
        libraries.removeValue(forKey: id)
    }
}
