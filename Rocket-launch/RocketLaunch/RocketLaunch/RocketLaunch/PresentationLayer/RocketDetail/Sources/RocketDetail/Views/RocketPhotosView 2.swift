//
//  RocketPhotosView.swift
//  
//
//  Created by Tomáš Brand on 19.03.2023.
//

import SwiftUI
import UIToolkit

struct RocketPhotosView: View {
    
    // MARK: - Stored Properties
    
    private let dismiss: () -> Void
    
    @State private var selectedImage = 0
    private var images: [Image]
    private let imageSize: CGFloat = 18
    
    // MARK: - Init
    
    public init(
        images: [Image],
        dismiss: @escaping () -> Void
    ) {
        self.images = images
        self.dismiss = dismiss
    }
    
    // MARK: - Body and views
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.default) {
                        dismiss()
                    }
                }, label: {
                    AppTheme.Images.xMarkIcon
                        .resizable()
                        .frame(width: imageSize, height: imageSize)
                        .foregroundColor(AppTheme.Colors.mainPink)
                })
            }
            .padding(.horizontal)
           
            Spacer()
            
            TabView(selection: $selectedImage) {
                ForEach(0..<images.count, id: \.self) { index in
                    images[index]
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            
        }
        .background(AppTheme.Colors.black)
    }
}

struct RocketPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        RocketPhotosView(images: [], dismiss: {})
    }
}
