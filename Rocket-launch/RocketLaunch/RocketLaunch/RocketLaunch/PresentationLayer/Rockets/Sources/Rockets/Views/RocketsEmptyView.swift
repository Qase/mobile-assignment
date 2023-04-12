//
//  RocketsEmptyView.swift
//  
//
//  Created by Tomáš Brand on 15.03.2023.
//

import SwiftUI
import UIToolkit

struct RocketsEmptyView: View {
    
    // MARK: - Stored properties
    
    private let imageSizeWidth: CGFloat = 80
    private let imageSizeHeight: CGFloat = 150
    private let textWidth: CGFloat = 200
    
    // MARK: - Body and views
    
    var body: some View {
        VStack(spacing: Dimension.spaceLarge) {
            AppTheme.Images.rocketIdleIcon
                .resizable()
                .frame(width: imageSizeWidth, height: imageSizeHeight)
            
            Text(Strings.rocketsEmptyScreenTitle)
                .foregroundColor(AppTheme.Colors.text)
                .font(AppTheme.Fonts.bodyText)
                .frame(width: textWidth)
                .multilineTextAlignment(.center)
        }
    }
}

struct RocketsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsEmptyView()
    }
}
