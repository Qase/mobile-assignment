//
//  BackButtonStyle.swift
//  
//
//  Created by Tomáš Brand on 19.03.2023.
//

import SwiftUI

public struct BackButtonStyle: ButtonStyle {
    
    // MARK: - Stored Properties
    
    private let buttonSize: CGFloat = 40
    private let iconSizeWidth: CGFloat = 9
    private let iconSizeHeight: CGFloat = 18
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Body and views
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .fill(LinearGradient.default)
                .cornerRadius(Dimension.radiusLarge)
                .frame(width: buttonSize, height: buttonSize)
            
            HStack {
                AppTheme.Images.chevronBackIcon
                    .resizable()
                    .frame(width: iconSizeWidth, height: iconSizeHeight)
                    .foregroundColor(AppTheme.Colors.mainPink)
            }
        }
    }
}

struct BackButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("") {}
                .buttonStyle(BackButtonStyle())
            Spacer()
        }
    }
}


