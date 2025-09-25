import Foundation

/// The link to the booking resource.
public struct LinksBooking: Codable, Hashable, Sendable {
    public let booking: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        booking: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.booking = booking
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.booking = try container.decodeIfPresent(String.self, forKey: .booking)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.booking, forKey: .booking)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case booking
    }
}