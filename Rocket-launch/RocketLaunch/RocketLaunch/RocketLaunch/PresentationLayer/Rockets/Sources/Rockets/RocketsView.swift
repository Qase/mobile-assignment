//
//  RocketsView.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import SwiftUI
import UIToolkit

struct RocketsView: View {
    
    // MARK: - Store properties
    
    @ObservedObject private var viewModel: RocketsViewModel
    
    // MARK: - Init
    
    init(viewModel: RocketsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body and views
    
    var body: some View {
        VStack(spacing: Dimension.spaceMediumLarge) {
            if !viewModel.state.showEmptyView {
                HStack {
                    HeadlineText(font: AppTheme.Fonts.headlineText, Strings.rocketsListTitle)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                ListWithoutSeparator {
                    let rockets = viewModel.state.isLoading
                        ? viewModel.state.skeletonRocketsData
                        : viewModel.state.rockets
                    
                    ForEach(0..<rockets.count, id: \.self) { index in
                        let rocket = rockets[index]
                        
                        RocketCellView(title: rocket.name, text: rocket.firstFlight)
                            .skeleton(viewModel.state.isLoading)
                            .padding(.vertical, Dimension.paddingMediumLarge)
                            .padding(.horizontal)
                            .onTapGesture {
                                viewModel.onIntent(.showDetail(rocket.id))
                            }
                    }
                }
            } else {
                RocketsEmptyView()
            }
        }
        .lifecycle(viewModel)
        .animateContent(!viewModel.state.isLoading)
        .backgroundStyle(.imageBackground)
        .alert(item: Binding<AlertData?>(
            get: { viewModel.state.alert },
            set: { _ in viewModel.onIntent(.dismissAlert) }
        )) { alertData in .init(alertData) }
    }
}

struct RocketsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsView(viewModel: RocketsViewModel(flowController: nil))
    }
}
