//
//  HeaderImage.swift
//  
//
//  Created by Tomáš Brand on 18.03.2023.
//

import SwiftUI

public struct HeaderImage: View {
    
    // MARK: - Stored properties
    
    private let url: String
    private let geo: GeometryProxy
    private var height: CGFloat = 0
    private var offset: CGFloat = 0
    private let hStackYOffset: CGFloat = -24
    
    private let onPhotoButtonTap: () -> Void
    
    // MARK: - Init
    
    public init(
        url: String,
        geo: GeometryProxy,
        height: CGFloat,
        offset: CGFloat,
        onPhotoButtonTap: @escaping () -> Void
    ) {
        self.url = url
        self.geo = geo
        self.height = height
        self.offset = offset
        self.onPhotoButtonTap = onPhotoButtonTap
    }
    
    // MARK: - Body and views
    
    public var body: some View {
        ZStack {
            RemoteImage(
                stringURL: url,
                defaultImage: AppTheme.Images.rocketIcon
            )
            .scaledToFill()
            .frame(
                width: geo.size.width,
                height: height,
                alignment: .center
            )
            .blur(radius: getBlurRadiusForImage(geo))
            .clipped()
            .offset(y: offset)
            
            Group {
                HStack {
                    Spacer()
                    Button(Strings.rocketPhotosButtonTitle) {
                        onPhotoButtonTap()
                    }
                    .buttonStyle(PhotosButtonStyle())
                }
                .padding()
                .offset(y: hStackYOffset)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(width: geo.size.width, height: height)
    }
}

// MARK: - Private methods

private extension HeaderImage {
    private func getBlurRadiusForImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).maxY
        let height = geometry.size.height
        let blur = (height - max(offset, 0)) / height
        return blur * 6
    }
}

struct HeaderImage_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            HeaderImage(
                url: "",
                geo: geo,
                height: 300,
                offset: 75,
                onPhotoButtonTap: {}
            )
        }
    }
}

