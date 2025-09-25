import Foundation

/// A problem detail object as defined in RFC 7807.
public struct Problem: Codable, Hashable, Sendable {
    /// A URI reference that identifies the problem type
    public let type: String?
    /// A short, human-readable summary of the problem type
    public let title: String?
    /// A human-readable explanation specific to this occurrence of the problem
    public let detail: String?
    /// A URI reference that identifies the specific occurrence of the problem
    public let instance: String?
    /// The HTTP status code
    public let status: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: String? = nil,
        title: String? = nil,
        detail: String? = nil,
        instance: String? = nil,
        status: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.title = title
        self.detail = detail
        self.instance = instance
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.detail = try container.decodeIfPresent(String.self, forKey: .detail)
        self.instance = try container.decodeIfPresent(String.self, forKey: .instance)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.detail, forKey: .detail)
        try container.encodeIfPresent(self.instance, forKey: .instance)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case title
        case detail
        case instance
        case status
    }
}