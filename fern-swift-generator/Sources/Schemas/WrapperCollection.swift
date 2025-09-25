import Foundation

/// This is a generic request/response wrapper which contains both data and links which serve as hypermedia controls (HATEOAS).
public struct WrapperCollection: Codable, Hashable, Sendable {
    /// The wrapper for a collection is an array of objects.
    public let data: [[String: JSONValue]]?
    /// A set of hypermedia links which serve as controls for the client.
    public let links: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [[String: JSONValue]]? = nil,
        links: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.links = links
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .data)
        self.links = try container.decodeIfPresent([String: JSONValue].self, forKey: .links)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.data, forKey: .data)
        try container.encodeIfPresent(self.links, forKey: .links)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case links
    }
}