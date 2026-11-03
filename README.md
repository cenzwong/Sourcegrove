# Sourcegrove

Sourcegrove is a persistent, Apple-native Local Knowledge Librarian built around independently curated folders.

## Current State

This repository contains the foundational scaffolding and architecture as defined in the Engineering Blueprint.

**Implemented:**
- **Repository Structure:** SwiftUI modular monolith layout, domain packages (`KnowledgeCore`, `LibraryManagement`, `SQLiteStore`, `SourceDiscovery`, `ContentExtraction`).
- **Core Domain Models:** Definitions for `Library`, `Source`, `Concept`, `Claim`, and `Relationship` inside `KnowledgeCore`.
- **Storage Subsystems:** `SQLiteStore` (FTS5 basic schema skeleton) and `LanceBridge` (Rust C ABI integration with Swift `VectorStore` wrapper).
- **Processing Routing:** `SourceDiscovery` (file monitoring concepts) and `ContentExtraction` (Extractor protocol and PDFExtractor stub).
- **ADRs:** Placeholders and core architectural decision records (macOS 27 Target, SwiftUI Monolith, Native Rust Bridge).

**Blockers:**
- **Environment Constraints:** The execution sandbox is Linux x86_64 running rustc 1.94.0 and missing a macOS Xcode/Swift toolchain.
  - Cannot build the Swift packages natively or run XCTests.
  - Rust `lancedb` compilation relies on aws-sdk packages that require rustc 1.94.1 minimum or rustc 1.95 for `parking_lot`. The C-ABI was successfully coded but mocked out for `cargo check`.

## Next Steps

When loaded on a macOS 27+ / Apple Silicon environment with Xcode 27+:
1. Provide actual SQLite3 / LanceDB implementations using local C bindings.
2. Hook up native AppKit / FSEvents in `SourceDiscovery`.
3. Implement `NaturalLanguage` and `Vision` in intelligence modules.
