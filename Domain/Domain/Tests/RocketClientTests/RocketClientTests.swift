//
//  RocketClientTests.swift
//  
//
//  Created by Martin Ficek on 10.04.2023.
//

import Foundation
import XCTest
import ComposableArchitecture
import Combine
import XCTestDynamicOverlay
import RocketClient
import Rocket
import APIClient
import Networking
import RequestBuilder
import XCTestHelper

final class RocketClientTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func testRocketClient() throws {
        
        let sut = withDependencies {
            $0.apiClient = APIClient(request: { _ in
                let mockHeaders = [
                    HTTPHeader(name: "Content-Type",
                               value: "application/json; charset=utf-8")
                ]
                
                let mockBody = try! JSONEncoder().encode([Rocket].mock)
                
                return Just<(headers: [HTTPHeader], body: Data)> (
                    (headers: mockHeaders, body: mockBody))
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
            }
            )
        } operation: {
            RocketClient.liveValue
        }
        
        let result = try awaitPublisher(sut.fetchAllRockets())
        XCTAssertEqual(result, [Rocket].mock)
    }
    
    func testFailRocketClient() throws {
        let expectation = expectation(description: "Awaiting Failure")
        var cancellables = Set<AnyCancellable>()
        
        let sut = withDependencies {
            $0.apiClient = APIClient(request: { _ in
                let mockHeaders = [
                    HTTPHeader(name: "Content-Type",
                               value: "None")
                ]
                
                let mockBody = try! JSONEncoder().encode([Rocket].mock)
                
                return Just<(headers: [HTTPHeader], body: Data)> (
                    (headers: mockHeaders, body: mockBody))
                .setFailureType(to: NetworkError.self)
                .eraseToAnyPublisher()
                }
            )
        } operation: {
            RocketClient.liveValue
        }
        
        let result = sut.fetchAllRockets()
        
        result
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished: XCTFail()
                    case .failure(let error):
                        XCTAssertEqual(error, .networkError)
                    }
                    expectation.fulfill()
                }, receiveValue: { _ in }
            )
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 5)
    }
}


