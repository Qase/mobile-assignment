//
//  File.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 20.02.2025.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var navigationStateViewModel: NavigationStateViewModel
    var headerTitle: String
    var backToView: DifferentViews = .HomeView
    var showLaunchButton: Bool = true
    var backText: String = "Rockets"
    
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    HStack (spacing: 0) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            
                        Text(backText)
                    }
                }.padding(.leading, 20)
                    .foregroundStyle(.link)
                    .onTapGesture {
                        navigationStateViewModel.onViewChanged(newView: backToView)
                    }
                Spacer()
                HStack {
                    Text(headerTitle)
                }
                Spacer()
                if showLaunchButton {
                    HStack {
                        Text("Launch")
                    }.padding(.trailing, 20)
                        .foregroundStyle(.link)
                        .onTapGesture {
                            navigationStateViewModel.onViewChanged(newView: .LaunchView)
                        }
                }
                
            }.padding()
        }.background(Color.init(.systemGray6))
    }
}
