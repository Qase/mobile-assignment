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
            VStack {
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView()
                        .foregroundColor(.red)
                case .failed(let error):
                    Text(error.localizedDescription)
                case .loaded(let rockets):
                    LoadedView(rockets: rockets)
                }
            }.navigationTitle("Rockets")
        }
        .onAppear {
            viewModel.fetchRockets()
        }
    }
    
    private func LoadedView(rockets: [Rocket]) -> some View {
        List {
            ForEach(rockets) { rocket in
                NavigationLink(destination: RocketDetailView(viewModel: RocketViewModel(rocket: rocket))
                ) {
                    cellView(rocket: rocket)
                }
            }
        }
    }
    
    private func cellView(rocket: Rocket) -> some View {
        HStack {
            Image("Rocket")
            VStack(alignment: .leading) {
                Text(rocket.name)
                    .font(.headline)
                Text("First flight: \(rocket.first_flight)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - RocketListView Preview
struct RocketListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketListView(viewModel: RocketListViewModel())
    }
}

