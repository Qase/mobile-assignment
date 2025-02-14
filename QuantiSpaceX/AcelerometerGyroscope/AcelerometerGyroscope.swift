//
//  AcelerometerGyroscope.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 27.12.2024.
//

import Foundation
import CoreMotion

class AcelerometerGyroscope: ObservableObject {
    
    let motion = CMMotionManager()
    var timer = Timer()
    var GyroVar = 0
    var gyroData: CMGyroData?

    func startGyros(completion: @escaping (Bool) -> ()) {
        if motion.isGyroAvailable {
            self.motion.gyroUpdateInterval = 1.0 / 60.0
            self.motion.startGyroUpdates()

            // Configure a timer to fetch the accelerometer data.

            self.timer = Timer(fire: Date(), interval: (1.0/60.0),

            repeats: true, block: { (timer) in
// Get the gyro data.
                if let data = self.motion.gyroData {
                    let x = data.rotationRate.x
                    let y = data.rotationRate.y
                    let z = data.rotationRate.z
//                    print("gyro works \nx: \(x)\ny: \(y)\nz: \(z)\n")
                    if x > 1 {
                        print("X is greater than 1")
                        completion(true)
                    }
                    if y > 1 {
                        print("Y is greater than 1")
                    }
                    if z > 1 {
                        print("Z is greater than 1")
                    }
            // Use the gyroscope data in your app.
                }
            })

      // Add the timer to the current run loop.
            RunLoop.current.add(self.timer, forMode: RunLoop.Mode.default)
        }
    }


    func stopGyros() {
        print("stop")
        if self.timer != nil {
            self.timer.invalidate()
            self.motion.stopGyroUpdates()
        }
    }
    
}
