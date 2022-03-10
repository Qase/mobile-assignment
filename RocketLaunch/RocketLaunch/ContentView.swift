//
//  ContentView.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 25.01.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    //TODO: při každém zobrazení této stránky by se mělo znovu fetchnout
    init(){
        viewModel.fetchRockets()
    }
    
    var body: some View {
        NavigationView {
            if viewModel.rockets.count > 0 {
                List {
                    ForEach(viewModel.rockets) { rocket in
                        NavigationLink(destination: RocketView(viewModel: RocketViewModel(rocket: rocket))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
