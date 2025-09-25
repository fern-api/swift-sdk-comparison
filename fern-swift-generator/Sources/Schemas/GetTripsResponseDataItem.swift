import Foundation

public struct GetTripsResponseDataItem: Codable, Hashable, Sendable {
    /// Unique identifier for the trip
    public let id: String?
    /// The starting station of the trip
    public let origin: String?
    /// The destination station of the trip
    public let destination: String?
    /// The date and time when the trip departs
    public let departureTime: Date?
    /// The date and time when the trip arrives
    public let arrivalTime: Date?
    /// The name of the operator of the trip
    public let `operator`: String?
    /// The cost of the trip
    public let price: Double?
    /// Indicates whether bicycles are allowed on the trip
    public let bicyclesAllowed: Bool?
    /// Indicates whether dogs are allowed on the trip
    public let dogsAllowed: Bool?
    public let self_: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        origin: String? = nil,
        destination: String? = nil,
        departureTime: Date? = nil,
        arrivalTime: Date? = nil,
        operator: String? = nil,
        price: Double? = nil,
        bicyclesAllowed: Bool? = nil,
        dogsAllowed: Bool? = nil,
        self_: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.origin = origin
        self.destination = destination
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.operator = `operator`
        self.price = price
        self.bicyclesAllowed = bicyclesAllowed
        self.dogsAllowed = dogsAllowed
        self.self_ = self_
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.origin = try container.decodeIfPresent(String.self, forKey: .origin)
        self.destination = try container.decodeIfPresent(String.self, forKey: .destination)
        self.departureTime = try container.decodeIfPresent(Date.self, forKey: .departureTime)
        self.arrivalTime = try container.decodeIfPresent(Date.self, forKey: .arrivalTime)
        self.operator = try container.decodeIfPresent(String.self, forKey: .operator)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.bicyclesAllowed = try container.decodeIfPresent(Bool.self, forKey: .bicyclesAllowed)
        self.dogsAllowed = try container.decodeIfPresent(Bool.self, forKey: .dogsAllowed)
        self.self_ = try container.decodeIfPresent(String.self, forKey: .self_)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.origin, forKey: .origin)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.departureTime, forKey: .departureTime)
        try container.encodeIfPresent(self.arrivalTime, forKey: .arrivalTime)
        try container.encodeIfPresent(self.operator, forKey: .operator)
        try container.encodeIfPresent(self.price, forKey: .price)
        try container.encodeIfPresent(self.bicyclesAllowed, forKey: .bicyclesAllowed)
        try container.encodeIfPresent(self.dogsAllowed, forKey: .dogsAllowed)
        try container.encodeIfPresent(self.self_, forKey: .self_)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case origin
        case destination
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
        case `operator`
        case price
        case bicyclesAllowed = "bicycles_allowed"
        case dogsAllowed = "dogs_allowed"
        case self_ = "self"
    }
}