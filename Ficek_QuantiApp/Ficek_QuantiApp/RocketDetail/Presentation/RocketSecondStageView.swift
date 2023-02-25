//
//  RocketSecondStageView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI

struct RocketSecondStageView: View {
    let rocket: Rocket
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Second Stage")
                .font(.headline)
            Group {
                HStack(spacing: 16) {
                    Image("Reusable")
                    if rocket.secondStage.reusable {
                        Text("Not reusable")
                    } else {
                        Text("reusable")
                    }
                }
                HStack(spacing: 16) {
                    Image("Engine")
                    Text(String(rocket.secondStage.engines) + " engines")
                }
                HStack(spacing: 16) {
                    Image("Fuel")
                    Text(String(rocket.secondStage.engines) + " tons of fuel")
                }
                HStack(spacing: 16) {
                    Image("Burn")
                    if let burnTimeSec = rocket.secondStage.burnTimeSEC {
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
//
//struct RocketSecondStageView_Previews: PreviewProvider {
//    static var previews: some View {
//        RocketSecondStageView()
//    }
//}
