//
//  ImageView.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import SwiftUI

// MARK: - Image View

struct ImageView: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                Icons.placeholder.image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Constants.cornerRadius)

            case let .failure(err):
                Text(err.localizedDescription)

            case let .success(image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Constants.cornerRadius)
            @unknown default:
                EmptyView()
            }
        }
    }
}

// MARK: ImageView Preview

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: URL(string: "https://imgur.com/DaCfMsj.jpg")!)
    }
}
