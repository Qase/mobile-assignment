//
//  ParameterCellView.swift
//  
//
//  Created by Tomáš Brand on 19.03.2023.
//

import SwiftUI
import UIToolkit

struct ParameterCellView: View {
    
    // MARK: - Stored properties
    
    private let valueTitle: String
    private let valueUnit: String
    
    private let titleMaskHeight: CGFloat = 34
    private let cellBackgroundSizeWidth: CGFloat = 104
    private let cellBackgroundSizeHeight: CGFloat = 96
    
    // MARK: - Init
    
    init(valueTitle: String, valueUnit: String) {
        self.valueTitle = valueTitle
        self.valueUnit = valueUnit
    }
    
    // MARK: - Body and views
    
    var body: some View {
        VStack(spacing: Dimension.spaceMediumSmall) {
            LinearGradient(
                colors: AppTheme.Colors.itemGradient,
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(height: titleMaskHeight)
            .mask(
                Text(valueTitle)
                    .font(AppTheme.Fonts.cellLargeTitle)
            )
            
            Text(valueUnit)
                .foregroundColor(AppTheme.Colors.text)
                .font(AppTheme.Fonts.bodyText)
        }
        .backgroundStyle(
            .cellBackgroundStyle(
                cellBackgroundSizeWidth,
                cellBackgroundSizeHeight
            )
        )
    }
}

struct ParameterCellView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterCellView(valueTitle: "40", valueUnit: "tons")
    }
}
