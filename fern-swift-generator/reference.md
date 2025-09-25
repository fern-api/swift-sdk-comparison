# Reference
## Stations
<details><summary><code>client.stations.<a href="/Sources/Resources/Stations/StationsClient.swift">getStations</a>(page: Int?, limit: Int?, coordinates: String?, search: String?, country: String?, requestOptions: RequestOptions?) -> GetStationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated and searchable list of all train stations.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import TrainTravel

private func main() async throws {
    let client = TrainTravelClient(token: "<token>")

    try await client.stations.getStations(request: .init(
        coordinates: "52.5200,13.4050",
        search: "Milano Centrale",
        country: "DE"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Int?` — The page number to return
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — The number of items to return per page
    
</dd>
</dl>

<dl>
<dd>

**coordinates:** `String?` — The latitude and longitude of the user's location, to narrow down the search results to sites within a proximity of this location.
    
</dd>
</dl>

<dl>
<dd>

**search:** `String?` — A search term to filter the list of stations by name or address.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — Filter stations by country code
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Trips
<details><summary><code>client.trips.<a href="/Sources/Resources/Trips/TripsClient.swift">getTrips</a>(page: Int?, limit: Int?, origin: String, destination: String, date: Date, bicycles: Bool?, dogs: Bool?, requestOptions: RequestOptions?) -> GetTripsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of available train trips between the specified origin and destination stations on the given date, and allows for filtering by bicycle and dog allowances.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import TrainTravel

private func main() async throws {
    let client = TrainTravelClient(token: "<token>")

    try await client.trips.getTrips(request: .init(
        origin: "efdbb9d1-02c2-4bc3-afb7-6788d8782b1e",
        destination: "b2e783e1-c824-4d63-b37a-d8d698862f1d",
        date: try! Date("2024-02-01T09:00:00Z", strategy: .iso8601)
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Int?` — The page number to return
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — The number of items to return per page
    
</dd>
</dl>

<dl>
<dd>

**origin:** `String` — The ID of the origin station
    
</dd>
</dl>

<dl>
<dd>

**destination:** `String` — The ID of the destination station
    
</dd>
</dl>

<dl>
<dd>

**date:** `Date` — The date and time of the trip in ISO 8601 format in origin station's timezone.
    
</dd>
</dl>

<dl>
<dd>

**bicycles:** `Bool?` — Only return trips where bicycles are known to be allowed
    
</dd>
</dl>

<dl>
<dd>

**dogs:** `Bool?` — Only return trips where dogs are known to be allowed
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bookings
<details><summary><code>client.bookings.<a href="/Sources/Resources/Bookings/BookingsClient.swift">getBookings</a>(page: Int?, limit: Int?, requestOptions: RequestOptions?) -> GetBookingsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of all trip bookings by the authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import TrainTravel

private func main() async throws {
    let client = TrainTravelClient(token: "<token>")

    try await client.bookings.getBookings(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Int?` — The page number to return
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — The number of items to return per page
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bookings.<a href="/Sources/Resources/Bookings/BookingsClient.swift">createBooking</a>(request: Booking, requestOptions: RequestOptions?) -> CreateBookingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

A booking is a temporary hold on a trip. It is not confirmed until the payment is processed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import TrainTravel

private func main() async throws {
    let client = TrainTravelClient(token: "<token>")

    try await client.bookings.createBooking(request: Booking(

    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Booking` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bookings.<a href="/Sources/Resources/Bookings/BookingsClient.swift">getBooking</a>(bookingId: String, requestOptions: RequestOptions?) -> GetBookingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the details of a specific booking.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import TrainTravel

private func main() async throws {
    let client = TrainTravelClient(token: "<token>")

    try await client.bookings.getBooking(bookingId: "1725ff48-ab45-4bb5-9d02-88745177dedb")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the booking to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bookings.<a href="/Sources/Resources/Bookings/BookingsClient.swift">deleteBooking</a>(bookingId: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a booking, cancelling the hold on the trip.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import TrainTravel

private func main() async throws {
    let client = TrainTravelClient(token: "<token>")

    try await client.bookings.deleteBooking(bookingId: "1725ff48-ab45-4bb5-9d02-88745177dedb")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the booking to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payments
<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">createBookingPayment</a>(bookingId: String, request: BookingPayment, requestOptions: RequestOptions?) -> CreateBookingPaymentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

A payment is an attempt to pay for the booking, which will confirm the booking for the user and enable them to get their tickets.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import TrainTravel

private func main() async throws {
    let client = TrainTravelClient(token: "<token>")

    try await client.payments.createBookingPayment(
        bookingId: "1725ff48-ab45-4bb5-9d02-88745177dedb",
        request: BookingPayment(
            amount: 49.99,
            currency: .gbp,
            source: BookingPaymentSource.card(
                .init(
                    name: "J. Doe",
                    number: "4242424242424242",
                    cvc: "123",
                    expMonth: 12,
                    expYear: 2025,
                    addressLine1: "123 Fake Street",
                    addressLine2: "4th Floor",
                    addressCity: "London",
                    addressCountry: "gb",
                    addressPostCode: "N12 9XX"
                )
            )
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the booking to pay for.
    
</dd>
</dl>

<dl>
<dd>

**request:** `BookingPayment` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>
