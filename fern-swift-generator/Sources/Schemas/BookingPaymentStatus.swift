import Foundation

/// The status of the payment, one of `pending`, `succeeded`, or `failed`.
public enum BookingPaymentStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case succeeded
    case failed
}