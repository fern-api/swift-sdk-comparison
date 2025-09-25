import Foundation

/// A card (debit or credit) to take payment from.
public struct Card: Codable, Hashable, Sendable {
    /// Cardholder's full name as it appears on the card.
    public let name: String
    /// The card number, as a string without any separators. On read all but the last four digits will be masked for security.
    public let number: String
    /// Card security code, 3 or 4 digits usually found on the back of the card.
    public let cvc: String
    /// Two-digit number representing the card's expiration month.
    public let expMonth: Int64
    /// Four-digit number representing the card's expiration year.
    public let expYear: Int64
    public let addressLine1: String?
    public let addressLine2: String?
    public let addressCity: String?
    public let addressCountry: String
    public let addressPostCode: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        number: String,
        cvc: String,
        expMonth: Int64,
        expYear: Int64,
        addressLine1: String? = nil,
        addressLine2: String? = nil,
        addressCity: String? = nil,
        addressCountry: String,
        addressPostCode: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.number = number
        self.cvc = cvc
        self.expMonth = expMonth
        self.expYear = expYear
        self.addressLine1 = addressLine1
        self.addressLine2 = addressLine2
        self.addressCity = addressCity
        self.addressCountry = addressCountry
        self.addressPostCode = addressPostCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.number = try container.decode(String.self, forKey: .number)
        self.cvc = try container.decode(String.self, forKey: .cvc)
        self.expMonth = try container.decode(Int64.self, forKey: .expMonth)
        self.expYear = try container.decode(Int64.self, forKey: .expYear)
        self.addressLine1 = try container.decodeIfPresent(String.self, forKey: .addressLine1)
        self.addressLine2 = try container.decodeIfPresent(String.self, forKey: .addressLine2)
        self.addressCity = try container.decodeIfPresent(String.self, forKey: .addressCity)
        self.addressCountry = try container.decode(String.self, forKey: .addressCountry)
        self.addressPostCode = try container.decodeIfPresent(String.self, forKey: .addressPostCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.number, forKey: .number)
        try container.encode(self.cvc, forKey: .cvc)
        try container.encode(self.expMonth, forKey: .expMonth)
        try container.encode(self.expYear, forKey: .expYear)
        try container.encodeIfPresent(self.addressLine1, forKey: .addressLine1)
        try container.encodeIfPresent(self.addressLine2, forKey: .addressLine2)
        try container.encodeIfPresent(self.addressCity, forKey: .addressCity)
        try container.encode(self.addressCountry, forKey: .addressCountry)
        try container.encodeIfPresent(self.addressPostCode, forKey: .addressPostCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case number
        case cvc
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case addressLine1 = "address_line1"
        case addressLine2 = "address_line2"
        case addressCity = "address_city"
        case addressCountry = "address_country"
        case addressPostCode = "address_post_code"
    }
}