//
//  RocketLaunchView.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 25.02.2022.
//

import SwiftUI
import CoreMotion

struct RocketLaunchView: View {
    @ObservedObject var motionManager = MotionManager()
    
    @State private var animated = false
    private var movingBackward: Bool { motionManager.x <= -0.5 }
    
    @State private var position: CGPoint = .init(x: UIScreen.screenWidth/2,
                                                 y: UIScreen.screenHeight - 230)
    private var endPosition: CGPoint = .init(x: UIScreen.screenWidth/2, y: -200)
    
    var body: some View {
        VStack {
            if ( movingBackward == true && animated == false ) {
                Image("Rocket Flying")
                    //.frame(width: 30, height: 30)
                    .position(position)
                    .animation(.easeOut.speed(0.15))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                            position = endPosition
                        }
                    }
                    .onDisappear {
                        animated = true
                    }
            } else {
                Image("Rocket Idle")
                    .frame(width: 30, height: 30)
                    //.animation(.easeInOut.speed(0.15))
                    .position(position)
            }
            
            Text("Move your phone up to launch the rocket")
                .padding()
            //Text("X: \(motionManager.x)")
        }
        .navigationBarTitle("Launch")
        .navigationBarTitleDisplayMode(.inline)
    }
}

fileprivate extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


extension Animation {
    static func animate() -> Animation {
        Animation.spring(dampingFraction: 0.5)
    }
}


struct RocketLaunchView_Previews: PreviewProvider {
    let iphone12 = "iPhone 12"
    let iphoneSE = "iPhone SE"
    let iphone7  = "iPhone 7"
    
    static var previews: some View {
        RocketLaunchView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
        
        RocketLaunchView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
