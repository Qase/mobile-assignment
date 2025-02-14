//
//  ContentView.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import SwiftUI

struct RocketListView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color.init(.lightGray)
                .edgesIgnoringSafeArea(.all)
            HStack {
                if let rocketList = viewModel.rocketModel.rocketList {
                    NavigationView {
                        List(rocketList) { rocketList in
                            NavigationLink {
                                RocketDetailView(rocketList: rocketList)
                            } label: {
                                MenukRow(shipname: rocketList.name, firstFlight: rocketList.first_flight ?? "unkown")
                            }
                        }
                        .navigationTitle("Rockets")
                    } 
                }
                
            }
        }
    }
}

struct MenukRow: View {
    var shipname: String
    var firstFlight: String

    var body: some View {
        HStack {
            
            Image("Rocket")
                .resizable()
                .frame(width: 30, height: 30)
            VStack (alignment: .leading){
                Text(shipname)
                Text("first flight: \(firstFlight)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    
            }.padding(.leading, 10)

            Spacer()
        }
    }
}

#Preview {
    RocketListView(viewModel: MainViewModel(apiClient: MockAPIClient()))
}
