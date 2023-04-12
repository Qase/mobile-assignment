//
//  LaunchButtonStyle.swift
//  
//
//  Created by Tomáš Brand on 31.03.2023.
//

import SwiftUI

public struct LaunchButtonStyle: ButtonStyle {
    
    // MARK: - Stored Properties
    
    private let buttonSizeWidth: CGFloat = 112
    private let buttonSizeHeight: CGFloat = 40
    private let iconSizeWidth: CGFloat = 9
    private let iconSizeHeight: CGFloat = 18
    private let titleMaskHeight: CGFloat = 20
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Body and views
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Capsule()
                .fill(LinearGradient.default)
                .cornerRadius(Dimension.radiusLarge)
                .frame(width: buttonSizeWidth, height: buttonSizeHeight)
            
            LinearGradient(
                colors: AppTheme.Colors.itemGradient,
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(height: titleMaskHeight)
            .mask(
                configuration.label
                    .font(AppTheme.Fonts.headlineTextSmall)
            )
        }
    }
}

struct LaunchButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Launch") {}
                .buttonStyle(LaunchButtonStyle())
            Spacer()
        }
    }
}
