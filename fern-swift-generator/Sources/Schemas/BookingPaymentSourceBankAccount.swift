import Foundation

/// A bank account to take payment from. Must be able to make payments in the currency specified in the payment.
public struct BookingPaymentSourceBankAccount: Codable, Hashable, Sendable {
    public let name: String
    /// The account number for the bank account, in string form. Must be a current account.
    public let number: String
    /// The sort code for the bank account, in string form. Must be a six-digit number.
    public let sortCode: String?
    /// The type of entity that holds the account. This can be either `individual` or `company`.
    public let accountType: BookingPaymentSourceBankAccountAccountType
    /// The name of the bank associated with the routing number.
    public let bankName: String
    /// Two-letter country code (ISO 3166-1 alpha-2).
    public let country: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        number: String,
        sortCode: String? = nil,
        accountType: BookingPaymentSourceBankAccountAccountType,
        bankName: String,
        country: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.number = number
        self.sortCode = sortCode
        self.accountType = accountType
        self.bankName = bankName
        self.country = country
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.number = try container.decode(String.self, forKey: .number)
        self.sortCode = try container.decodeIfPresent(String.self, forKey: .sortCode)
        self.accountType = try container.decode(BookingPaymentSourceBankAccountAccountType.self, forKey: .accountType)
        self.bankName = try container.decode(String.self, forKey: .bankName)
        self.country = try container.decode(String.self, forKey: .country)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.number, forKey: .number)
        try container.encodeIfPresent(self.sortCode, forKey: .sortCode)
        try container.encode(self.accountType, forKey: .accountType)
        try container.encode(self.bankName, forKey: .bankName)
        try container.encode(self.country, forKey: .country)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case number
        case sortCode = "sort_code"
        case accountType = "account_type"
        case bankName = "bank_name"
        case country
    }
}