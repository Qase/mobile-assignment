//
//  RocketDetailContentView.swift
//  
//
//  Created by Tomáš Brand on 19.03.2023.
//

import SwiftUI
import UIToolkit
import SharedDomain

public struct RocketDetailContentView: View {
    
    // MARK: - Stored properties
    
    private let rocket: Rocket
    
    private let contentTopPadding: CGFloat = 16
    
    // MARK: - Init
    
    public init(rocket: Rocket) {
        self.rocket = rocket
    }
    
    // MARK: - Body and views
    
    public var body: some View {
        VStack(spacing: Dimension.spaceLarge) {
            HStack {
                HeadlineText(font: AppTheme.Fonts.headlineText, rocket.name)
                Spacer()
            }
            
            Text(rocket.description)
                .foregroundColor(AppTheme.Colors.text)
                .font(AppTheme.Fonts.bodyText)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            VStack(spacing: Dimension.spaceXLarge) {
                HStack {
                    HeadlineText(font: AppTheme.Fonts.headlineTextSmall, Strings.paramsSectionTitle)
                    Spacer()
                }
                
                HStack {
                    ParameterCellView(
                        valueTitle: rocket.formattedMetersHeight,
                        valueUnit: Strings.heightValueTitle
                    )
                    
                    ParameterCellView(
                        valueTitle: rocket.formattedMetersDiamter,
                        valueUnit: Strings.diameterValueTitle
                    )
                    
                    ParameterCellView(
                        valueTitle: rocket.formattedTonsMass,
                        valueUnit: Strings.massValueTitle
                    )
                }
                
                VStack(spacing: Dimension.spaceMedium) {
                    HStack {
                        HeadlineText(font: AppTheme.Fonts.headlineTextSmall, Strings.stagesSectionTitle)
                        Spacer()
                    }
        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: Dimension.spaceMedium) {
                            ForEach(rocket.rocketStages, id: \.self) { stage in
                                StageCellView(rocketStage: stage)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, contentTopPadding)
    }
}

#if DEBUG
struct RocketDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailContentView(
            rocket:
                Rocket(
                    id: "",
                    name: "Falcon",
                    description: "Rocket short description",
                    wikipedia: "",
                    active: true,
                    stages: 2,
                    boosters: 2,
                    costPerLaunch: 234,
                    successRatePct: 2,
                    firstFlight: "2022-02-23 15:00:00",
                    country: "",
                    company: "",
                    flickrImages: [],
                    firstStage: RocketFirstStage(
                        reusable: true,
                        engines: 4,
                        fuelAmountTons: 2443,
                        burnTimeSec: 12456
                    ),
                    secondStage: RocketSecondStage(
                        reusable: true,
                        engines: 67,
                        fuelAmountTons: 45567,
                        burnTimeSec: 234565
                    ),
                    height: RocketHeight(meters: 23.5, feet: 14.0),
                    diameter: RocketDiameter(meters: 12.2, feet: 39.9),
                    mass: RocketMass(kg: 1234, lb: 123)
                )
        )
    }
}
#endif
