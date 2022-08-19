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
    
    @Published private var x: Double = 0.0
    
    @Published public var movingBackward: Bool = false
    //@Published private var y: Double = 0.0
    //@Published private var z: Double = 0.0
    
    /*public var movingBackward: Bool {
        return x <= -0.5 ? true : false
    }*/
    
    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.gyroUpdateInterval = 1/60
        self.motionManager.startGyroUpdates(to: .main) {[weak self] (gyroscopData, error) in
            // todo: unwrap motionManager
            guard let self = self else {
                return
            }
            
            guard error == nil else {
                print(error!)
                return
            }
            
            if let gyroData = gyroscopData {
                //self.x = gyroData.rotationRate.x
                if (gyroData.rotationRate.x <= -0.5) {
                    self.movingBackward = true
                    self.motionManager.stopGyroUpdates() //disable gyro
                }
                //self.y = gyroData.rotationRate.y
                //self.z = gyroData.rotationRate.z
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
