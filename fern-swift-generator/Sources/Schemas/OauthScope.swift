import Foundation

public enum OauthScope: String, Codable, Hashable, CaseIterable, Sendable {
    /// Read access
    case read
    /// Write access
    case write
}