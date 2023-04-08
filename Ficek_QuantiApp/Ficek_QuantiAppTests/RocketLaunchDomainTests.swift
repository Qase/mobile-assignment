//
//  RocketLaunchDomainTests.swift
//  Ficek_QuantiAppTests
//
//  Created by Martin Ficek on 28.02.2023.
//

import Foundation
import XCTest
import ComposableArchitecture
@testable import Ficek_QuantiApp
import SwiftUI
import CoreMotionClient

@MainActor
final class RocketLaunchDomainTests: XCTestCase {
    @Dependency(\.coreMotionClient) var coreMotionClient
    
    func testDomain() async {
        let store = TestStore(
            initialState: RocketLaunchDomain.State(),
            reducer: RocketLaunchDomain()
        )
       
        await store.send(.flying(0))
        await store.send(.flying(3)) {
            $0.isFlying = true
        }
    }
}
