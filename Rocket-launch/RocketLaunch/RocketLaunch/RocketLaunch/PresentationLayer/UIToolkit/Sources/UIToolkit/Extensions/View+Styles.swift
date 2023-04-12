//
//  View+Styles.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import SwiftUI

public enum BackgroundStyleType {
    case imageBackground
    case mainBackground
    case itemBackground
    case cellBackgroundStyle(CGFloat, CGFloat)
}

public extension View {
    
    @ViewBuilder
    func backgroundStyle(_ type: BackgroundStyleType) -> some View {
        switch type {
        case .imageBackground:
            imageBackground()
        case .mainBackground:
            mainBackgroundStyle()
        case .itemBackground:
            itemBackgroundStyle()
        case .cellBackgroundStyle(let width, let height):
            cellBackgroundStyle(width: width, height: height)
        }
    }
    
    private func imageBackground() -> some View {
        background(
            AppTheme.Images.backgroundImage
                .ignoresSafeArea()
        )
    }
    
    private func mainBackgroundStyle() -> some View {
        background(
            LinearGradient(
                colors: AppTheme.Colors.bgGradient,
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }
    
    private func itemBackgroundStyle() -> some View {
        background(
            LinearGradient(
                colors: AppTheme.Colors.itemGradient,
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }
    
    private func cellBackgroundStyle(width: CGFloat, height: CGFloat) -> some View {
        background(
            ZStack {
                RoundedRectangle(cornerRadius: Dimension.radiusMediumSmall)
                    .fill(LinearGradient.default)
                    .frame(width: width, height: height)
                
                RoundedRectangle(cornerRadius: Dimension.radiusMediumSmall)
                    .stroke(
                        LinearGradient.inverse,
                        lineWidth: 2
                    )
                    .frame(width: width, height: height)
            }
        )
    }
}
