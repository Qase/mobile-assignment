//
//  ListItemView.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 15.02.2025.
//

import SwiftUI

struct RocketListItem: View {
    
    var rocketList: RocketList

    var body: some View {
        HStack {
            Image("Rocket")
                .resizable()
                .frame(width: 30, height: 30)
            VStack (alignment: .leading){
                Text(rocketList.name)
                    .bold()
                if let rocketFlightDate =  rocketList.first_flight{
                    Text("first flight: \(rocketFlightDate)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                    
                    
            }.padding(.leading, 10)

            Spacer()
            Image(systemName: "chevron.forward")
        }
    }

}

#Preview {
    RocketListItem(rocketList: RocketList(height: Height(meters: 10,feet: 15), diameter: Diameter(meters: 30,feet: 70), mass: Mass(kg: 8000,lb: 900000), first_stage: FirstStage(thrust_sea_level:ThrustSeaLevel(kn: 30, lbf: 500),thrust_vacuum: ThrustVacuum(kn: 60, lbf: 100), reusable: true, engines: 2, burn_time_sec: 20), second_stage: SecondStage(burn_time_sec: 800000), engines: Engines(isp: Isp(sea_level: 8000, vacuum: 70),engine_loss_max: 20,propellant_1: "one",propellant_2: "two", thrust_to_weight: 600000), landing_legs: LandingLegs(number: 9, material: "Titanium"), payload_weights: [PayloadWeight(id: "57681", kg: 8000, lb: 2000)], flickr_images: ["https://fastly.picsum.photos/id/864/200/300.jpg?hmac=pHxnt4rXpNHIqBRpVSe-yL_pDtdwDfasgfub8GwI5mw", "https://fastly.picsum.photos/id/950/200/300.jpg?hmac=EEKbkKLpjWodOy9F68WA1hJkukq9UBUCIREC8fDW44U"], name: "Rocket East One", type: "Runnning", active: false, stages: 5, boosters: 12, cost_per_launch: 12000000, success_rate_pct: 12.5, first_flight: "15th of January 1975", country: "Czech", company: "Petronium", wikipedia: "none", description: "Lorem impsum dolor sit amet.", id: "54678"))
}
