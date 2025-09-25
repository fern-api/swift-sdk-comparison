import Foundation

public struct GetBookingResponse: Codable, Hashable, Sendable {
    /// Unique identifier for the booking
    public let id: String?
    /// Identifier of the booked trip
    public let tripId: String?
    /// Name of the passenger
    public let passengerName: String?
    /// Indicates whether the passenger has a bicycle.
    public let hasBicycle: Bool?
    /// Indicates whether the passenger has a dog.
    public let hasDog: Bool?
    public let links: LinksSelf?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        tripId: String? = nil,
        passengerName: String? = nil,
        hasBicycle: Bool? = nil,
        hasDog: Bool? = nil,
        links: LinksSelf? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.tripId = tripId
        self.passengerName = passengerName
        self.hasBicycle = hasBicycle
        self.hasDog = hasDog
        self.links = links
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.tripId = try container.decodeIfPresent(String.self, forKey: .tripId)
        self.passengerName = try container.decodeIfPresent(String.self, forKey: .passengerName)
        self.hasBicycle = try container.decodeIfPresent(Bool.self, forKey: .hasBicycle)
        self.hasDog = try container.decodeIfPresent(Bool.self, forKey: .hasDog)
        self.links = try container.decodeIfPresent(LinksSelf.self, forKey: .links)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.tripId, forKey: .tripId)
        try container.encodeIfPresent(self.passengerName, forKey: .passengerName)
        try container.encodeIfPresent(self.hasBicycle, forKey: .hasBicycle)
        try container.encodeIfPresent(self.hasDog, forKey: .hasDog)
        try container.encodeIfPresent(self.links, forKey: .links)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case tripId = "trip_id"
        case passengerName = "passenger_name"
        case hasBicycle = "has_bicycle"
        case hasDog = "has_dog"
        case links
    }
}