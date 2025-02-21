//
//  MainView.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import SwiftUI

struct NavigationView: View {
    @EnvironmentObject var navigationStateViewModel: NavigationStateViewModel
    @ObservedObject var viewModel: MainViewModel
    
    init(
        viewModel: MainViewModel
    ) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            switch navigationStateViewModel.currentView {
            case .HomeView:
                  RocketListView(viewModel: viewModel)
            case .DetailView:
                if let rocketListData = viewModel.currentRocketDetailList {
                    RocketDetailView(rocketList: rocketListData)
                } else {
                    ProgressView()
                }
            case .LaunchView:
                RocketLaunchView()
            }
        }
    }
}

