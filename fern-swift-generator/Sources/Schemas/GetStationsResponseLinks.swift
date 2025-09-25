import Foundation

public struct GetStationsResponseLinks: Codable, Hashable, Sendable {
    public let `self`: String?
    public let next: String?
    public let prev: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        self: String? = nil,
        next: String? = nil,
        prev: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.self = `self`
        self.next = next
        self.prev = prev
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.self = try container.decodeIfPresent(String.self, forKey: .self)
        self.next = try container.decodeIfPresent(String.self, forKey: .next)
        self.prev = try container.decodeIfPresent(String.self, forKey: .prev)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.self, forKey: .self)
        try container.encodeIfPresent(self.next, forKey: .next)
        try container.encodeIfPresent(self.prev, forKey: .prev)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case `self`
        case next
        case prev
    }
}