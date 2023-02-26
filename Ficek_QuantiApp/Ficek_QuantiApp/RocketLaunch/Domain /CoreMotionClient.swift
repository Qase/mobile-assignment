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
    
   // let rocketRequest: (Input) throws -> URLRequest
}

extension CoreMotionClient: DependencyKey {
    static var liveValue: CoreMotionClient {
        
        return Self(
           
        )
    }
}


struct MotionManager {
    var motion = CMMotionManager()
   
    // Read the most recent accelerometer value
//    manager.accelerometerData?.acceleration.x
//    manager.accelerometerData?.acceleration.y
//    manager.accelerometerData?.acceleration.z

    // How frequently to read accelerometer updates, in seconds
//    manager.accelerometerUpdateInterval = 0.1

//     Start accelerometer updates on a specific thread
//    manager.startAccelerometerUpdates(to: .main) { (data, error) in
        // Handle acceleration update
//    }
//    managerstartAccelerometerUpdates() {
//
//    }
}
