import Foundation

public final class PaymentsClient: Sendable {
    private let httpClient: HTTPClient

    public init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// A payment is an attempt to pay for the booking, which will confirm the booking for the user and enable them to get their tickets.
    ///
    /// - Parameter bookingId: The ID of the booking to pay for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createBookingPayment(bookingId: String, request: BookingPayment, requestOptions: RequestOptions? = nil) async throws -> CreateBookingPaymentResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/bookings/\(bookingId)/payment",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateBookingPaymentResponse.self
        )
    }
}