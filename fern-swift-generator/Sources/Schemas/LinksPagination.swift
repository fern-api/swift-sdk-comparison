import Foundation

/// Links to the next and previous pages of a paginated response.
public struct LinksPagination: Codable, Hashable, Sendable {
    public let next: String?
    public let prev: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        next: String? = nil,
        prev: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.next = next
        self.prev = prev
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.next = try container.decodeIfPresent(String.self, forKey: .next)
        self.prev = try container.decodeIfPresent(String.self, forKey: .prev)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.next, forKey: .next)
        try container.encodeIfPresent(self.prev, forKey: .prev)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case next
        case prev
    }
}