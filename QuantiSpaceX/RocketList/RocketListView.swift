//
//  ContentView.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import SwiftUI

struct RocketListView: View {
    @EnvironmentObject var navigationStateViewModel: NavigationStateViewModel
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color.init(.systemGray6)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                HStack {
                    Text("Rockets")
                        .font(.system(size: 40).weight(.heavy))
                        .padding(.leading, 20)
                        
                    Spacer()
                }.padding(.top, 20)
                NavigationStack {
                    if let rocketList = viewModel.rocketModel.rocketList {
                                        List(rocketList) { rocketList in
                                            VStack {
                                                RocketListItem(rocketList: rocketList)
                                            }.contentShape(Rectangle())
                                            .onTapGesture {
                                                // Setup current list
                                                viewModel.currentRocketDetailList = rocketList
                                                // Change view
                                                navigationStateViewModel.onViewChanged(newView: .DetailView)
                                            }
                                        }
                    }
                }
                
            }
        }
    }
}



#Preview {
    RocketListView(viewModel: MainViewModel(apiClient: MockAPIClient()))
}
