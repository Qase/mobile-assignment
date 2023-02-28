//
//  CoreMotionClient.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 26.02.2023.
//

import Foundation
import ComposableArchitecture
import XCTestDynamicOverlay
import CoreMotion

extension DependencyValues {
    var coreMotionClient: CoreMotionClient {
        get { self[CoreMotionClient.self] }
        set { self[CoreMotionClient.self] = newValue }
    }
}

struct CoreMotionClient {
    
    //    struct Input {
    //        let url: URL
    //
    //    }
    
    let xRotationRate: (OperationQueue) async throws -> AsyncThrowingStream<Double, Error>
}

extension CoreMotionClient: DependencyKey {
    @MainActor
    static var liveValue: CoreMotionClient {
        let motionManager = CMMotionManager()
        
        return Self(
            xRotationRate: { queue in
                AsyncThrowingStream<Double, Error> { continuation in
                    motionManager.gyroUpdateInterval = 1/60
                    motionManager.startGyroUpdates(to: queue) { gyroData, error in
                        if let gyroData {
                            continuation.yield(gyroData.rotationRate.x)
                        } else if let error {
                            continuation.finish(throwing: error)
                        }
                    }
                    continuation.onTermination = { _ in motionManager.stopGyroUpdates() }
                }
            }
        )
    }
}
