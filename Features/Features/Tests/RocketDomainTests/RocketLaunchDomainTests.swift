//
//  RocketLaunchDomainTests.swift
//  
//
//  Created by Martin Ficek on 10.04.2023.
//
import Foundation
import XCTest
import ComposableArchitecture
import SwiftUI
import CoreMotionClient
import RocketLaunch

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
