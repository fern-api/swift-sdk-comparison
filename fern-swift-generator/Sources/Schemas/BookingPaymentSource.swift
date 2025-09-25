import Foundation

/// The payment source to take the payment from. This can be a card or a bank account. Some of these properties will be hidden on read to protect PII leaking.
public enum BookingPaymentSource: Codable, Hashable, Sendable {
    /// A card (debit or credit) to take payment from.
    case card(Card)
    /// A bank account to take payment from. Must be able to make payments in the currency specified in the payment.
    case bankAccount(BankAccount)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .object)
        switch discriminant {
        case "card":
            self = .card(try Card(from: decoder))
        case "bank_account":
            self = .bankAccount(try BankAccount(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        switch self {
        case .card(let data):
            try data.encode(to: encoder)
        case .bankAccount(let data):
            try data.encode(to: encoder)
        }
    }

    /// A card (debit or credit) to take payment from.
    public struct Card: Codable, Hashable, Sendable {
        public let object: String = "card"
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
            try container.encode(self.object, forKey: .object)
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
            case object
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

    /// A bank account to take payment from. Must be able to make payments in the currency specified in the payment.
    public struct BankAccount: Codable, Hashable, Sendable {
        public let object: String = "bank_account"
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
            try container.encode(self.object, forKey: .object)
            try container.encode(self.name, forKey: .name)
            try container.encode(self.number, forKey: .number)
            try container.encodeIfPresent(self.sortCode, forKey: .sortCode)
            try container.encode(self.accountType, forKey: .accountType)
            try container.encode(self.bankName, forKey: .bankName)
            try container.encode(self.country, forKey: .country)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case object
            case name
            case number
            case sortCode = "sort_code"
            case accountType = "account_type"
            case bankName = "bank_name"
            case country
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case object
    }
}