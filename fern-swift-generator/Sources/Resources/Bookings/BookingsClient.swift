import Foundation

public final class BookingsClient: Sendable {
    private let httpClient: HTTPClient

    public init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a list of all trip bookings by the authenticated user.
    ///
    /// - Parameter page: The page number to return
    /// - Parameter limit: The number of items to return per page
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getBookings(page: Int? = nil, limit: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> GetBookingsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/bookings",
            queryParams: [
                "page": page.map { .int($0) }, 
                "limit": limit.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetBookingsResponse.self
        )
    }

    /// A booking is a temporary hold on a trip. It is not confirmed until the payment is processed.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createBooking(request: Booking, requestOptions: RequestOptions? = nil) async throws -> CreateBookingResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/bookings",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateBookingResponse.self
        )
    }

    /// Returns the details of a specific booking.
    ///
    /// - Parameter bookingId: The ID of the booking to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getBooking(bookingId: String, requestOptions: RequestOptions? = nil) async throws -> GetBookingResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/bookings/\(bookingId)",
            requestOptions: requestOptions,
            responseType: GetBookingResponse.self
        )
    }

    /// Deletes a booking, cancelling the hold on the trip.
    ///
    /// - Parameter bookingId: The ID of the booking to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deleteBooking(bookingId: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/bookings/\(bookingId)",
            requestOptions: requestOptions
        )
    }
}