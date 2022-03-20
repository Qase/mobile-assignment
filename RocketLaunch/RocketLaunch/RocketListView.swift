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
    @ObservedObject var viewModel = RocketListViewModel()
    
    init() {
        viewModel.fetchRockets()
    }
    
    var body: some View {
        NavigationView {
            if viewModel.rockets.count > 0 {
                List {
                    ForEach(viewModel.rockets) { rocket in
                        NavigationLink(destination: RocketDetailView(viewModel: RocketViewModel(rocket: rocket))
                        ) {
                            cellView(rocket: rocket)
                        }
                    }
                }
                .navigationTitle("Rockets")
            } else {
                Text("No rockets in DB")
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
        RocketListView()
    }
}
