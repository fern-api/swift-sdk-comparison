import Foundation

/// The link to the destination station resource.
public struct LinksDestination: Codable, Hashable, Sendable {
    public let self_: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        self_: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.self_ = self_
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.self_ = try container.decodeIfPresent(String.self, forKey: .self_)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.self_, forKey: .self_)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case self_ = "self"
    }
}