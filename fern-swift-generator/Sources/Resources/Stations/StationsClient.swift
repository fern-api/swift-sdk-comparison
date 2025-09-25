import Foundation

public final class StationsClient: Sendable {
    private let httpClient: HTTPClient

    public init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated and searchable list of all train stations.
    ///
    /// - Parameter page: The page number to return
    /// - Parameter limit: The number of items to return per page
    /// - Parameter coordinates: The latitude and longitude of the user's location, to narrow down the search results to sites within a proximity of this location.
    /// - Parameter search: A search term to filter the list of stations by name or address.
    /// - Parameter country: Filter stations by country code
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getStations(page: Int? = nil, limit: Int? = nil, coordinates: String? = nil, search: String? = nil, country: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GetStationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/stations",
            queryParams: [
                "page": page.map { .int($0) }, 
                "limit": limit.map { .int($0) }, 
                "coordinates": coordinates.map { .string($0) }, 
                "search": search.map { .string($0) }, 
                "country": country.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetStationsResponse.self
        )
    }
}