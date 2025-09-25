import OpenAPIRuntime
import OpenAPIURLSession

let client = Client(
    serverURL: try Servers.Server1.url(),
    transport: URLSessionTransport()
)

let response = try await client.getBooking(.init(path: .init(bookingId: "abc")))
print(try response.ok.body.json)
