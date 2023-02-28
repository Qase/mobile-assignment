//
//  RockeListDomainTests.swift
//  Ficek_QuantiAppTests
//
//  Created by Martin Ficek on 28.02.2023.
//

import Foundation
import XCTest
import ComposableArchitecture
@testable import Ficek_QuantiApp
import SwiftUI

@MainActor
final class RocketListDomainTests: XCTestCase {
    @Dependency(\.rocketRepositoryClient.fetchAllRockets) var fetchAllRockets
    
    func testDomain() async {
        let store = TestStore(initialState: RocketListDomain.State(), reducer: RocketListDomain())
        await store.send(.fetchRockets(.success([Rocket].mock))) {
            $0.rocketItems = IdentifiedArrayOf(
                uniqueElements: [Rocket].mock.map { RocketDetailDomain.State(rocket: $0) } )
        }
        
    }
}
