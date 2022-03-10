//
//  MotionManager.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 03.03.2022.
//

import Foundation
import Combine
import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager: CMMotionManager
    
    @Published public var x: Double = 0.0
    @Published public var y: Double = 0.0
    @Published public var z: Double = 0.0
    
    public var movingBackward: Bool {
        return x > 0 ? true : false
    }
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.gyroUpdateInterval = 1/60
        self.motionManager.startGyroUpdates(to: .main) { (gyroscopData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let gyroData = gyroscopData {
                self.x = gyroData.rotationRate.x
                self.y = gyroData.rotationRate.y
                self.z = gyroData.rotationRate.z
            }
        }
        
        /*
        self.motionManager.magnetometerUpdateInterval = 1/60
        self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let magnetData = magnetometerData {
                self.x = magnetData.magneticField.x
                self.y = magnetData.magneticField.y
                self.z = magnetData.magneticField.z
            }
        }
         */
    }
   
    
}
