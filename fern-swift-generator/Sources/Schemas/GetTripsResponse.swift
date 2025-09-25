import Foundation

public struct GetTripsResponse: Codable, Hashable, Sendable {
    public let data: [GetTripsResponseDataItem]?
    public let links: GetTripsResponseLinks?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: [GetTripsResponseDataItem]? = nil,
        links: GetTripsResponseLinks? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.links = links
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decodeIfPresent([GetTripsResponseDataItem].self, forKey: .data)
        self.links = try container.decodeIfPresent(GetTripsResponseLinks.self, forKey: .links)
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