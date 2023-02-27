//
//  CoreMotionClient.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 26.02.2023.
//

import Foundation
import Dependencies
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
    
    let gyro: () async throws ->  Double
}

extension CoreMotionClient: DependencyKey {
    @MainActor
    static var liveValue: CoreMotionClient { 
        let motionManager = CMMotionManager()
        let motionQueue = OperationQueue()
        
        return Self(

            gyro: {
                motionManager.startGyroUpdates()
                    let data = motionManager.gyroData
                    guard let data = data else {
                        return 0
                    }
                    
                    let motion: CMRotationRate = data.rotationRate
                    motionManager.gyroUpdateInterval = 1/60
                    
                return motion.y

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
//            }
    }
}

