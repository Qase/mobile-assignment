//
//  RocketLaunchView.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 25.02.2022.
//

import SwiftUI
import CoreMotion

// MARK: - Rocket Launch View

struct RocketLaunchView: View {
    @ObservedObject var motionManager: MotionManager
    @State private var position: CGPoint = .init(x: UIScreen.screenWidth/2,
                                                 y: UIScreen.screenHeight - 230)
    private var endPosition: CGPoint = .init(x: UIScreen.screenWidth/2,
                                             y: -200)
    private var movingBackward: Bool {  motionManager.movingBackward }
    
    init(motionManager: MotionManager) {
        self.motionManager = motionManager
    }
    
    var body: some View {
        VStack {
            if ( movingBackward == true ) {
                Icons.flyingRocket.image
                    .position(position)
                    .animation(.easeOut.speed(0.15))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
                            position = endPosition
                        }
                    }
            } else {
                Icons.idleRocket.image
                    .frame(width: 30, height: 30)
                    .position(position)
            }
            
            Text(.RocketLaunch.notLaunched)
                .padding()
        }
        .navigationBarTitle(.RocketLaunch.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - RocketLaunchView Preview

struct RocketLaunchView_Previews: PreviewProvider {
    let iphone12 = "iPhone 12"
    let iphone7  = "iPhone 7"
    
    static var previews: some View {
        RocketLaunchView(motionManager: MotionManager())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
        
        RocketLaunchView(motionManager: MotionManager())
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
