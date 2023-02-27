//
//  RocketPhotosView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketPhotosView: View {
    let store: StoreOf<RocketDetailDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                Text("Photos")
                    .font(.headline)
                    .padding(.leading, 16)
                
                ForEach (viewStore.rocket.flickrImages, id: \.self) { image in
                    
                    AsyncImage(
                        url: URL(string: image),
                        content: { asyncImage in
                            asyncImage
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .scaledToFit()
                                .padding(15)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
            }
        }
    }
}

struct RocketPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        RocketPhotosView(
            store: Store(
                initialState: RocketDetailDomain.State(rocket: .mock),
                reducer: RocketDetailDomain()
            )
        )
    }
}
