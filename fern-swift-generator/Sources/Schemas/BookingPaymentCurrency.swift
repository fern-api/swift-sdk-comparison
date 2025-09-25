import Foundation

/// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
public enum BookingPaymentCurrency: String, Codable, Hashable, CaseIterable, Sendable {
    case bam
    case bgn
    case chf
    case eur
    case gbp
    case nok
    case sek
    case `try`
}