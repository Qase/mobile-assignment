//
//  MotionManager.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 03.03.2022.
//

import Combine
import CoreMotion

// MARK: - Motion Manager Service

class MotionManager: ObservableObject {
    private var motionManager: CMMotionManager 
    
    @Published private var x: Double = 0.0
    @Published public var movingBackward: Bool = false
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.gyroUpdateInterval = 1/60
        self.motionManager.startGyroUpdates(to: .main) {[weak self] (gyroscopData, error) in
            guard let self = self else {
                return
            }
            
            guard error == nil else {
                print(error!)
                return
            }
            
            if let gyroData = gyroscopData {
                if (gyroData.rotationRate.x <= -0.5) {
                    self.movingBackward = true
                    self.motionManager.stopGyroUpdates() //disable gyro
                }
            }
        }
    }

}
