//
//  RocketListView.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 25.01.2022.
//

import SwiftUI
import Combine

// MARK: - RocketListView

struct RocketListView: View {
    @ObservedObject var viewModel: RocketListViewModel
    
    var body: some View {
        NavigationView {
            AsyncContentView(source: viewModel) { rockets in
                loadedView(rockets: rockets)
            }
            .navigationTitle(.rocketList_title)
        }
        .onAppear {
            viewModel.fetchRockets()
        }
    }

    func loadedView(rockets: [Rocket]) -> some View {
        List {
            ForEach(rockets) { rocket in
                NavigationLink(destination: RocketDetailView(viewModel: RocketViewModel(rocketID: rocket.id))
                ) {
                    RocketCell(rocket: rocket)
                }
            }
        }
    }

}

// MARK: RocketListView Preview

struct RocketListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketListView(viewModel: RocketListViewModel())
    }
}
