import Foundation

/// The type of entity that holds the account. This can be either `individual` or `company`.
public enum BookingPaymentSourceBankAccountAccountType: String, Codable, Hashable, CaseIterable, Sendable {
    case individual
    case company
}