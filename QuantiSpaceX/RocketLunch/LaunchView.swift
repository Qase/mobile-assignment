//
//  LaunchView.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 27.12.2024.
//

import SwiftUI

struct LaunchView: View {
    @State private var isRocketInMove: Bool = false
    @State var imageName = "Rocket Idle"
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                if !isRocketInMove{
                        Image(isRocketInMove == false ? "Rocket Idle" : "Rocket Flying")
                            .transition(.move(edge: .top))
                }
                Text(isRocketInMove ? "Launch succesful!" : """
                    Move your phone up
                    to launch the rocket
                    """)
                .multilineTextAlignment(.center)
                .padding(.bottom, 240)
                .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .clipped()
            
        }.navigationTitle("Launch")
            
            .onAppear {
                AcelerometerGyroscope().startGyros() { isMobileUp in
                    print("Start Launcg: \(isMobileUp)")
                    if isMobileUp {
                        withAnimation {
                            isRocketInMove.toggle()
                        } completion: {
                            withAnimation {
                                isRocketInMove.toggle()
                            }
                        }
                        
                    }
                }
            }
            .onDisappear {
                AcelerometerGyroscope().stopGyros()
            }
    }
}


#Preview {
    LaunchView()
}
