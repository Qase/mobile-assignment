import Foundation

public func doAsync<Success: Decodable, TypedError: AsyncNetworkErrorMapable>(
  mapError: (Error) -> TypedError,
  body: () async throws -> Success
) async throws -> Success {
  do {
    return try await body()
  } catch let error {
    throw mapError(error)
  }
}
