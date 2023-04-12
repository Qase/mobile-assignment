//
//  SwiftUIView.swift
//  
//
//  Created by Tomáš Brand on 26.03.2023.
//

import SwiftUI
import UIToolkit
import SharedDomain

struct StageCellView: View {
    
    // MARK: - Stored properties
    
    private let rocketStage: RocketStage
    
    private let titleMaskHeight: CGFloat = 34
    private let cellSizeWidth: CGFloat = 264
    private let cellSizeHeight: CGFloat = 200
    
    // MARK: - Init
    
    init(rocketStage: RocketStage) {
        self.rocketStage = rocketStage
    }
    
    // MARK: - Body and views
    
    var body: some View {
        VStack(alignment: .leading, spacing: Dimension.spaceMediumSmall) {
            HeadlineText(
                font: AppTheme.Fonts.headlineTextSmall,
                rocketStage.isFirstStage
                    ? Strings.firstStageTitle
                    : Strings.secondStageTitle
            )
            
            VStack(alignment: .leading) {
                StagePropertyCellView(
                    image: AppTheme.Images.reusableIcon,
                    title: rocketStage.reusable
                        ? Strings.reusableCellTitle
                        : Strings.notReusableCellTitle
                )
                
                StagePropertyCellView(
                    image: AppTheme.Images.enginesIcon,
                    title: rocketStage.engines > 1
                        ? Strings.enginesCellTitle(rocketStage.engines)
                        : Strings.oneEngineCellTitle
                )
                
                StagePropertyCellView(
                    image: AppTheme.Images.fuelAmountIcon,
                    title: Strings.fuelAmountTons(rocketStage.fuelAmountTons)
                )
                
                StagePropertyCellView(
                    image: AppTheme.Images.burnTimeIcon,
                    title: Strings.burnTime(rocketStage.burnTimeSec)
                )
            }
            .foregroundColor(AppTheme.Colors.text)
            .font(AppTheme.Fonts.bodyText)
        }
        .padding(.vertical)
        .frame(width: cellSizeWidth)
        .backgroundStyle(.cellBackgroundStyle(cellSizeWidth, cellSizeHeight))
        .cornerRadius(Dimension.radiusMediumSmall)
    }
}

struct StageCellView_Previews: PreviewProvider {
    static var previews: some View {
        StageCellView(
            rocketStage:
                RocketStage(
                    reusable: true,
                    engines: 4,
                    fuelAmountTons: 2443,
                    burnTimeSec: 12456,
                    isFirstStage: true
                )
        )
    }
}
