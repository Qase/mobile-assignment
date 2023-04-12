//
//  ToastView.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import SwiftUI

struct ToastView: View {
    
    // MARK: - Stored properties
    
    private let data: ToastData
    private let imageSize: CGFloat = 16
    
    // MARK: - Init
    
    init(_ data: ToastData) {
        self.data = data
    }
    
    // MARK: - Body and views
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top) {
                data.style.image
                    .foregroundColor(data.style.color)
                    .frame(width: imageSize, height: imageSize)
                
                Text(data.title)
                    .foregroundColor(AppTheme.Colors.text)
                    .font(AppTheme.Fonts.toastMessage)
            }
            .padding()
        }
        .background(
            Capsule()
                .fill(AppTheme.Colors.bgGradientDark)
                .clipped()
        )
        .frame(minWidth: .zero, maxWidth: .infinity)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding(.horizontal, Dimension.paddingLarge)
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ToastView(ToastData("Info", style: .info, hideAfter: 1))
            ToastView(ToastData("Success", style: .success, hideAfter: 1))
            ToastView(ToastData("Error", style: .error, hideAfter: 1))
        }
    }
}

