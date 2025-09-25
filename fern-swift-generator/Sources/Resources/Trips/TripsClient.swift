import Foundation

public final class TripsClient: Sendable {
    private let httpClient: HTTPClient

    public init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a list of available train trips between the specified origin and destination stations on the given date, and allows for filtering by bicycle and dog allowances.
    ///
    /// - Parameter page: The page number to return
    /// - Parameter limit: The number of items to return per page
    /// - Parameter origin: The ID of the origin station
    /// - Parameter destination: The ID of the destination station
    /// - Parameter date: The date and time of the trip in ISO 8601 format in origin station's timezone.
    /// - Parameter bicycles: Only return trips where bicycles are known to be allowed
    /// - Parameter dogs: Only return trips where dogs are known to be allowed
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getTrips(page: Int? = nil, limit: Int? = nil, origin: String, destination: String, date: Date, bicycles: Bool? = nil, dogs: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> GetTripsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/trips",
            queryParams: [
                "page": page.map { .int($0) }, 
                "limit": limit.map { .int($0) }, 
                "origin": .string(origin), 
                "destination": .string(destination), 
                "date": .date(date), 
                "bicycles": bicycles.map { .bool($0) }, 
                "dogs": dogs.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetTripsResponse.self
        )
    }
}