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
import Combine

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
    
    // let gyro: () async -> Bool
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

struct MotionManager {
    let motionManager = CMMotionManager()
    let motionQueue = OperationQueue()
    
    func startAcceleroMeter() -> Double{
        //        motionManager.startGyroUpdates(to: motionQueue) { (data: CMGyroData?, error: Error?) in
        //            guard let data = data else {
        //                print("Error: \(error!)")
        //                return
        //            }
        //
        //            let motion: CMRotationRate = data.rotationRate
        //            motionManager.gyroUpdateInterval = 1/60
        //
        //            DispatchQueue.main.async {
        //                // print("X: ",motion.x)
        //                print("Y: ",motion.y)
        //                //print("Z: ",motion.z)
        //            }
        //        }
        motionManager.startGyroUpdates()
        let data = motionManager.gyroData
        guard let data = data else {
            return 0
        }
        
        let motion: CMRotationRate = data.rotationRate
        motionManager.gyroUpdateInterval = 1/60
        
        return motion.y
        //            DispatchQueue.main.async {
        //                // print("X: ",motion.x)
        //                if motion.y > 1 {
        //                    return true
        //                }
        //                print("Y: ",motion.y)
        //                //print("Z: ",motion.z)
        //            })
        
        //    return Self(
        //            gyro: {
        //                var yRotation = false
        //
        //                func gyro(completionHandler: @escaping (Bool) -> Void) {
        //                    //                motionManager.startGyroUpdates(to: OperationQueue()) { data, error in
        //                    //                    return Effect.run { subscriber in
        //                    //                          if let data = data {
        //                    //                            subscriber.send(data)
        //                    //                          } else if let error = error {
        //                    //                            subscriber.send(completion: .failure(error))
        //                    //                          }
        //                    //                        }
        //                    //                }
        //                    //                return AnyCancellable {
        //                    //                  motionManager.stopGyroUpdates()
        //                    //                }
        //                    //
        //
        //                    motionManager.startGyroUpdates()
        //                    let data = motionManager.gyroData
        //                    guard let data = data else {
        //                        return
        //                    }
        //
        //                    let motion: CMRotationRate = data.rotationRate
        //                    motionManager.gyroUpdateInterval = 1/60
        //
        //                    DispatchQueue.main.async {
        //                        if motion.y > 1 { completionHandler(true) }
        //                    }
        //                }
        //
        //                gyro { result in
        //                    yRotation = result
        //                }
        //                return yRotation
        //            }
        //        )
        
    }
}

