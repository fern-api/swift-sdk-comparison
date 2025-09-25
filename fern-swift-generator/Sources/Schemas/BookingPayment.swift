import Foundation

/// A payment for a booking.
public struct BookingPayment: Codable, Hashable, Sendable {
    /// Unique identifier for the payment. This will be a unique identifier for the payment, and is used to reference the payment in other objects.
    public let id: String?
    /// Amount intended to be collected by this payment. A positive decimal figure describing the amount to be collected.
    public let amount: Double?
    /// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
    public let currency: BookingPaymentCurrency?
    /// The payment source to take the payment from. This can be a card or a bank account. Some of these properties will be hidden on read to protect PII leaking.
    public let source: BookingPaymentSource?
    /// The status of the payment, one of `pending`, `succeeded`, or `failed`.
    public let status: BookingPaymentStatus?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        amount: Double? = nil,
        currency: BookingPaymentCurrency? = nil,
        source: BookingPaymentSource? = nil,
        status: BookingPaymentStatus? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.amount = amount
        self.currency = currency
        self.source = source
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.amount = try container.decodeIfPresent(Double.self, forKey: .amount)
        self.currency = try container.decodeIfPresent(BookingPaymentCurrency.self, forKey: .currency)
        self.source = try container.decodeIfPresent(BookingPaymentSource.self, forKey: .source)
        self.status = try container.decodeIfPresent(BookingPaymentStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case amount
        case currency
        case source
        case status
    }
}