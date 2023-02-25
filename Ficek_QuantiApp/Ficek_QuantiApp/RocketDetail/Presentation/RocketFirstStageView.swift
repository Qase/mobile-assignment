//
//  RocketFirstStageView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI

struct RocketFirstStageView: View {
    let rocket: Rocket
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("First Stage")
                .font(.headline)
            Group {
                HStack(spacing: 16) {
                    Image("Reusable")
                    if rocket.firstStage.reusable {
                        Text("Not reusable")
                    } else {
                        Text("reusable")
                    }
                }
                HStack(spacing: 16) {
                    Image("Engine")
                    Text(String(rocket.engines.number) + " engines")
                }
                HStack(spacing: 16) {
                    Image("Fuel")
                    Text(String(rocket.firstStage.fuelAmountTons) + " tons of fuel")
                }
                HStack(spacing: 16) {
                    Image("Burn")
                    if let burnTimeSec = rocket.firstStage.burnTimeSEC {
                        Text(String(burnTimeSec) + " seconds burn time")
                    } else {
                        Text("Data not available")
                    }
                }
            }
            .font(.subheadline)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.gray).opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

//struct RocketFirstStageView_Previews: PreviewProvider {
//    static var previews: some View {
//        RocketFirstStageView()
//    }
//}
