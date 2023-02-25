//
//  RocketPhotosView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI

struct RocketPhotosView: View {
    var rocket: Rocket
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Photos")
                .font(.headline)
                .padding(.leading, 16)
            
            ForEach (rocket.flickrImages, id: \.self) { image in
                
                AsyncImage(url: URL(string: image), content: { asyncImage in
                    asyncImage
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFit()
                        .padding(15)
                }, placeholder: {
                    ProgressView()
                    }
                )
            }
        }
        
        
        
    }
}
//
//struct RocketPhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        RocketPhotosView()
//    }
//}
