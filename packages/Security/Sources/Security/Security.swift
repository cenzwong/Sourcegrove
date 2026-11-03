#if os(macOS)
import Foundation
import Security

public enum SecurityError: Error {
    case keychainSaveFailed
    case keychainReadFailed
}

public class SecureStorage {
    public init() {}

    public func saveSecret(key: String, value: String) throws {
        // Implement macOS Keychain saving
        let data = value.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary)

        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            throw SecurityError.keychainSaveFailed
        }
    }

    public func readSecret(key: String) throws -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess, let data = dataTypeRef as? Data {
            return String(data: data, encoding: .utf8)
        } else if status == errSecItemNotFound {
            return nil
        } else {
            throw SecurityError.keychainReadFailed
        }
    }
}
#endif
