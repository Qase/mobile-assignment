//
//  RocketDetail.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 27.12.2024.
//

import SwiftUI

struct RocketDetailView: View {
    @State var rocketList: RocketList
    
        var body: some View {
            VStack {
                Header(headerTitle: rocketList.name, backToView: .HomeView, showLaunchButton: true)
                
            ScrollView {
                VStack (alignment: .leading) {
                    HStack (alignment: .top){
                        VStack (alignment: .leading){
                            Text("Overview")
                                .font(.headline)
                                .bold()
                                .padding(.bottom, 5)
                            Text(rocketList.description ?? "overview is not available")
                        }
                    }.padding(.bottom, 15)
                    HStack (alignment: .top){
                        VStack (alignment: .leading) {
                            Text("Parameters")
                                .font(.headline)
                                .bold()
                                .padding(.bottom, 5)
                            HStack {
                                if let height = rocketList.height?.meters, let diameter = rocketList.diameter?.meters, let mass = rocketList.mass?.kg {
                                    ParameterTile(firstText: "\(height)m", secondText: "height")
                                    
                                    Spacer()
                                    ParameterTile(firstText: ("\(diameter)m"), secondText: "diameter")
                                    Spacer()
                                    ParameterTile(firstText: ("\(mass)t"), secondText: "mass")
                                }
                                
                            }
                            
                        }
                        
                    }
                    if let engine = rocketList.first_stage?.engines, let burnTime = rocketList.first_stage?.burn_time_sec,
                    let fuelAmount = rocketList.first_stage?.fuel_amount_tons{
                        StageList(stageName: "First Stage", reusabel: rocketList.first_stage?.reusable == true ? "reusable" : "not reusable", engine: engine, fuel: fuelAmount, burn: burnTime)
                    }
                    
                    if let engine = rocketList.second_stage?.engines, let burnTime = rocketList.second_stage?.burn_time_sec,
                    let fuelAmount = rocketList.second_stage?.fuel_amount_tons{
                        StageList(stageName: "Second Stage", reusabel: rocketList.second_stage?.reusable == true ? "reusable" : "not reusable", engine: engine, fuel: fuelAmount, burn: burnTime)
                    }
                    
                    
                    HStack {
                        VStack (alignment: .leading){
                            Text("Photos")
                                .font(.headline)
                                .bold()
                            VStack {
                                if let rocketImages = rocketList.flickr_images {
                                    ForEach (rocketImages, id: \.self) { image in
                                        AsyncImage(url: URL(string: image)) { image in
                                            image.resizable()
                                                .scaledToFit()
                                                .padding(.bottom, 10)
                                        } placeholder: {
                                            VStack {
                                                HStack {
                                                    Spacer()
                                                    ProgressView()
                                                        .frame(width: 150, height: 150, alignment: .center)
                                                    Spacer()
                                                }
                                            }
                                            
                                        }
                                        .clipShape(.rect(cornerRadius: 15))
                                    }
                                }
                                
                            }
                        }
                    }
                }
                .padding(30)
            }
            .navigationTitle(rocketList.name)
            .navigationBarTitleDisplayMode(.inline)
            }
    }
}

struct ParameterTile: View {
    var firstText: String
    var secondText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.rocketPink)
                            .frame(width: 100, height: 100)
                            .cornerRadius(15)
            VStack {
                Text(firstText)
                    .foregroundColor(.white)
                    .bold()
                    .font(.title2)
                Text(secondText)
                    .foregroundColor(.white)
            }
        }.padding(.bottom, 20)
    }
}

#Preview {
    RocketDetailView(rocketList: MockAPIClient().getRocketList())
}
