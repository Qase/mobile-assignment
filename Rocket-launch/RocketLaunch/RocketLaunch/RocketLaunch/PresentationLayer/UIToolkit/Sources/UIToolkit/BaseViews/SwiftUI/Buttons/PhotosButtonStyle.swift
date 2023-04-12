//
//  PhotosButtonStyle.swift
//  
//
//  Created by Tomáš Brand on 18.03.2023.
//

import SwiftUI

public struct PhotosButtonStyle: ButtonStyle {
    
    // MARK: - Stored Properties
    
    private let buttonSizeWidth: CGFloat = 96
    private let buttonSizeHeight: CGFloat = 32
    private let iconSizeWidth: CGFloat = 18
    private let iconSizeHeight: CGFloat = 14
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - Body and views
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Capsule()
                .fill(LinearGradient.default).opacity(0.8)
                .cornerRadius(Dimension.radiusLarge)
                .frame(width: buttonSizeWidth, height: buttonSizeHeight)
            
            HStack {
                AppTheme.Images.cameraIcon
                    .resizable()
                    .foregroundColor(AppTheme.Colors.text)
                    .frame(width: iconSizeWidth, height: iconSizeHeight)
                
                configuration.label
                    .font(AppTheme.Fonts.photoButton)
                    .foregroundColor(AppTheme.Colors.text)
            }
        }
    }
}

struct PhotosButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Button("Lorem Ipsum") {}
                .buttonStyle(PhotosButtonStyle())
            Spacer()
        }
    }
}


