//
//  RocketView.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 24.02.2022.
//

import SwiftUI

// MARK: - Rocket View
struct RocketView: View {
    private var viewModel: RocketViewModel
    private var spacingInParts: CGFloat = 10
    private var spacingBetweenParts: CGFloat = 20
    private var cornerRadius: CGFloat = 10
    
    init(viewModel: RocketViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: spacingBetweenParts) {
                    OverviewPart
                    ParametersPart
                    StagePart(
                        reusable: viewModel.rocket.first_stage.reusable,
                        engines: viewModel.rocket.first_stage.engines,
                        fuel: viewModel.rocket.first_stage.fuel_amount_tons,
                        burn: viewModel.rocket.first_stage.burn_time_sec ?? 0
                    )
                    StagePart(
                        reusable: viewModel.rocket.second_stage.reusable,
                        engines: viewModel.rocket.second_stage.engines,
                        fuel: viewModel.rocket.second_stage.fuel_amount_tons,
                        burn: viewModel.rocket.second_stage.burn_time_sec ?? 0
                    )
                    ImagesPart()
                }
                .padding(.horizontal)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: RocketLaunchView()  ) {
                            Text("Launch")
                        }
                    }
                
            }
            .navigationBarTitle(viewModel.rocket.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
    
}

// MARK: - Subviews
extension RocketView {
    
    private var OverviewPart: some View {
        VStack(alignment: .leading, spacing: spacingInParts) {
            Text("Overview")
                .modifier(subsectionHeddingStyle())
            Text(viewModel.rocket.description)
                .fixedSize(horizontal: false, vertical: true)
        }
        .multilineTextAlignment(.leading)
    }
    
    
    private var ParametersPart: some View {
        let square_size: CGFloat = 100
        
        func rectangleView(upper: String, bottom: String) -> some View {
            Rectangle()
                .fill(.pink)
                .overlay(
                    VStack {
                        Text(upper)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(bottom)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                )
                .frame(height: square_size, alignment: .center)
                .cornerRadius(cornerRadius)
        }

        return VStack(alignment: .leading, spacing: spacingInParts) {
            Text("Parameters")
                .modifier(subsectionHeddingStyle())
            HStack {
                rectangleView(upper: viewModel.rocket.height.getLengthString(type: .meters), bottom: "heigh")
                rectangleView(upper: viewModel.rocket.diameter.getLengthString(type: .meters), bottom: "diameter")
                rectangleView(upper: viewModel.rocket.mass.getWeightString(type: .kg), bottom: "mass")
            }
        }
    }
    
    
    private func StagePart(reusable: Bool, engines: Int, fuel: Double, burn: Int = 0) -> some View {
        let reusableString: String = reusable ? "reusable" : "not reusable"
        let enginesString: String = engines > 1 ? "\(engines) engine" : "\(engines) engines"
        let fuelString: String = fuel == 1 ? "\(fuel) ton of fuel" : "\(fuel) tons of fuel"
        let burnString: String = burn > 1 ? "\(burn) seconds burn time" : "\(burn) second burn time"
        
        func StageItem(image: String, text: String) -> some View {
            HStack(spacing: spacingInParts) {
                Image(image)
                Text(text)
            }
        }
        
        return VStack(alignment: .leading, spacing: spacingInParts) {
            Text("First stage")
                .modifier(subsectionHeddingStyle())
            VStack(alignment: .leading, spacing: spacingInParts) {
                StageItem(image: "Reusable", text: reusableString)
                StageItem(image: "Engine", text: enginesString)
                StageItem(image: "Fuel", text: fuelString)
                StageItem(image: "Burn", text: burnString)
            }
            .padding(.horizontal, 20)
        }
    }
    
    
    private func ImagesPart() -> some View {
        @ViewBuilder
        func Image(url: String) -> some View {
            if let url = URL(string: url) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty: ProgressView()
                    case let .success(image):
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(cornerRadius)
                    case let .failure(error):
                        Text(error.localizedDescription)
                    @unknown default:
                        EmptyView()
                    }
                }
                
            } else {
                EmptyView()
            }
        }
        
        return VStack {
            Text("Photos")
                .modifier(subsectionHeddingStyle())
            
            ForEach(viewModel.rocket.flickr_images, id: \.self) {
                Image(url: $0)
            }
        }
    }
}



// MARK: - Preview
/*
struct RocketView_Previews: PreviewProvider {
    static var previews: some View {
        let rocket = Rocket(
            Id: "1234",
            name: "My awsome rocket",
            first_flight: "20.2.1996",
            description: "There is no way to express how awsome this rocket is.",
            height: Rocket.Length(meters: 200, feet: 200),
            diameter: Rocket.Length(meters: 200, feet: 200),
            mass: Rocket.Weight(kg: 1500, lb: 1500),
            first_stage: Stage(reusable: true,
                               engines: 2,
                               fuel_amount_tons: 0,
                               burn_time_sec: nil),
            second_stage: Stage(reusable: false,
                                engines: 1,
                                fuel_amount_tons: 0,
                                burn_time_sec: 2),
            flickr_images: []
        )
        let viewModel = RocketViewModel(rocket: rocket)
        RocketView(viewModel: viewModel)
 .previewLayout(.sizeThatFits)
    }
}
 */
