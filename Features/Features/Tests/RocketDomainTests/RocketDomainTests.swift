//
//  RocketDomainTests.swift
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
import RocketList
import RocketDetail

@MainActor
final class RocketDomainTests: XCTestCase {
    func testRocketListDomain() async {
        let store = TestStore(
            initialState: RocketListDomain.State(),
            reducer: RocketListDomain()
        )
        
        await store.send(.fetchRockets(.success([Rocket].mock))) {
            $0.rocketItems = IdentifiedArrayOf(
                uniqueElements: [Rocket].mock.map { RocketDetailDomain.State(rocket: $0) }
            )
        }
    }
}
