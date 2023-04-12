//
//  RemoteImage.swift
//  
//
//  Created by Tomáš Brand on 17.03.2023.
//

import Foundation
import SwiftUI

public struct RemoteImage: View {
    
    // MARK: - Stored Properties
    
    private let stringURL: String?
    private let defaultImage: Image
    private let contentMode: ContentMode
    private let failureMessage: String?
    
    // MARK: - Init
    
    public init(
        stringURL: String?,
        defaultImage: Image,
        contentMode: ContentMode = .fit,
        failureMessage: String? = nil
    ) {
        self.stringURL = stringURL
        self.defaultImage = defaultImage
        self.contentMode = contentMode
        self.failureMessage = failureMessage
    }
    
    // MARK: - Body and views
    
    public var body: some View {
        if let stringURL = stringURL, let url = URL(string: stringURL) {
            if let cached = ImageCache[url] {
                cached
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            } else {
                AsyncImage(url: URL(string: stringURL)) { phase in
                    switch phase {
                    case .empty:
                        placeholderContent()
                    case .success(let image):
                        content(url: url, phase: .success(image))
                    case .failure:
                        failureContent()
                    @unknown default:
                        failureContent()
                    }
                }
            }
        } else {
            placeholderContent()
        }
    }
    
    private func content(url: URL, phase: AsyncImagePhase) -> some View {
        var downloadedImg: Image = Image("")
        if case .success(let image) = phase {
            ImageCache[url] = image
            downloadedImg = image
        }
        return downloadedImg
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }

    @ViewBuilder
    private func placeholderContent() -> some View {
        defaultImage
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .skeleton(true)
    }

    @ViewBuilder
    private func failureContent() -> some View {
        if let failureMessage = failureMessage {
            Text(failureMessage)
                .font(.caption)
                .fontWeight(.medium)
        } else {
            placeholderContent()
        }
    }
}

// MARK: - Image caching

private class ImageCache {
    private static var cache: [URL: Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get { ImageCache.cache[url] }
        set { ImageCache.cache[url] = newValue }
    }
}

