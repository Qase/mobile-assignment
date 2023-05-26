import Combine
import Dependencies
@testable import Networking
import RequestBuilder
@testable import RocketsClient
import XCTest

final class RocketsClientCombineErrorLiveTests: XCTestCase {
  struct NetworkClientMock: NetworkClientType {
    var request: (_ urlRequest: URLRequest) -> AnyPublisher<(headers: [HTTPHeader], body: Data), NetworkError>

    func request(_ urlRequest: URLRequest) -> AnyPublisher<(headers: [HTTPHeader], body: Data), NetworkError> {
      request(urlRequest)
    }
  }

  private func setNetworkClient(requester: URLRequester) -> NetworkClient {
      NetworkClient(
        urlRequester: requester,
        networkMonitorClient: .live(onQueue: .main)
      )
  }

  func test_rocket_model_conversion_failure() async {
    // swiftlint:disable:next force_try
    let dataMock = try! JSONEncoder().encode(RocketDetailDTO.mock)
    let responseMock = HTTPURLResponse(
      url: URL(string: "www.google.com")!,
      statusCode: 200,
      httpVersion: nil,
      headerFields: [:]
    )!
    let requesterMock = URLRequester { _ in
      Just((dataMock, responseMock))
        .setFailureType(to: URLError.self)
        .eraseToAnyPublisher()
    }

    let modelConversionError = RocketsClientAsyncError.modelConversionError

    await withDependencies {
      $0.networkClientType = setNetworkClient(requester: requesterMock)
      $0.rocketConverter = .init(domainModelConverter: { _ in nil })
    } operation: {
      do {
        _ = try await RocketsClient.liveAsync.getRocket("")
      } catch let error {
        guard case let rocketAsyncError as RocketsClientAsyncError = error else {
          XCTFail("Unexpected error type.")
          return
        }

        XCTAssertEqual(rocketAsyncError.description, modelConversionError.description)
      }
    }
  }

  func test_rockets_model_conversion_failure() async {
    // swiftlint:disable:next force_try
    let dataMock = try! JSONEncoder().encode(RocketDetailDTO.mocks)
    let responseMock = HTTPURLResponse(
      url: URL(string: "www.google.com")!,
      statusCode: 200,
      httpVersion: nil,
      headerFields: [:]
    )!
    let requesterMock = URLRequester { _ in
      Just((dataMock, responseMock))
        .setFailureType(to: URLError.self)
        .eraseToAnyPublisher()
    }

    let modelConversionError = RocketsClientAsyncError.modelConversionError

    await withDependencies {
      $0.networkClientType = setNetworkClient(requester: requesterMock)
      $0.rocketsConverter = .init(domainModelConverter: { _ in nil })
    } operation: {
      do {
        _ = try await RocketsClient.liveAsync.getAllRockets()
      } catch {
        guard case let rocketAsyncError as RocketsClientAsyncError = error else {
          XCTFail("Unexpected error type.")
          return
        }

        XCTAssertEqual(rocketAsyncError.description, modelConversionError.description)
      }
    }
  }

  func test_rocket_network_failure() async {
    let networkClient = NetworkClientMock { _ in
      Fail<(headers: [HTTPHeader], body: Data), NetworkError>(error: NetworkError.noConnection)
        .eraseToAnyPublisher()
    }

    let networkError = RocketsClientAsyncError.networkError(.noConnection)

    await withDependencies {
      $0.networkClientType = networkClient
    } operation: {
      do {
        _ = try await RocketsClient.liveAsync.getRocket("")
      } catch let error {
        guard case let rocketsClientAsyncError as RocketsClientAsyncError = error else {
          XCTFail("Unexpected error type.")
          return
        }

        XCTAssertEqual(rocketsClientAsyncError.description, networkError.description)
      }
    }
  }

  func test_rockets_network_failure() async {
    let networkClient = NetworkClientMock { _ in
      Fail<(headers: [HTTPHeader], body: Data), NetworkError>(error: NetworkError.noConnection)
        .eraseToAnyPublisher()
    }

    let networkError = RocketsClientAsyncError.networkError(.noConnection)

    await withDependencies {
      $0.networkClientType = networkClient
    } operation: {
      do {
        _ = try await RocketsClient.liveAsync.getAllRockets()
      } catch let error {
        guard case let rocketsClientAsyncError as RocketsClientAsyncError = error else {
          XCTFail("Unexpected error type.")
          return
        }

        XCTAssertEqual(rocketsClientAsyncError.description, networkError.description)
      }
    }
  }
}
