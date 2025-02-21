//
//  StageList.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 20.02.2025.
//
import SwiftUI

struct StageList: View {
    
    var stageName: String
    var reusabel: String
    var engine: Int
    var fuel : Double
    var burn: Double
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){
                HStack {
                        Text(stageName)
                        .font(.headline)
                        .bold()
                        Spacer()
                }
                HStack {
                        Image("Reusable")
                        Text(reusabel)
                }
                HStack {
                        Image("Engine")
                        Text("\(engine) engine\(engine == 1 ? "" : "s")")
                }
                HStack {
                        Image("Fuel")
                        Text("\(String(format: "%.2f", fuel)) ton\(fuel == 1 ? "" : "s") of fuel")
                }
                HStack {
                        Image("Burn")
                        Text("\(String(format: "%.2f", burn)) second\(burn == 1 ? "" : "s") burn time")
                }
                
            }.padding()
        }.background(Color.smokewhite).cornerRadius(15).padding(.bottom, 15)
    }
}

#Preview {
    if let engine = MockAPIClient().getRocketList().second_stage?.engines, let burnTime = MockAPIClient().getRocketList().second_stage?.burn_time_sec,
       let fuelAmount = MockAPIClient().getRocketList().second_stage?.fuel_amount_tons,
       let reusable = MockAPIClient().getRocketList().second_stage?.reusable {
        StageList(stageName: "First/Second Stage", reusabel: reusable == true ? "reusable" : "not reusable", engine: engine, fuel: fuelAmount, burn: burnTime)
    }
    
}
