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
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(Constants.View.cornerRadius)
        } placeholder: {
            Icons.placeholder.image
                .resizable()
                .scaledToFit()
                .cornerRadius(Constants.View.cornerRadius)
        }
    }
}

// MARK: ImageView Preview

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: URL(string: "https://imgur.com/DaCfMsj.jpg")!)
    }
}
