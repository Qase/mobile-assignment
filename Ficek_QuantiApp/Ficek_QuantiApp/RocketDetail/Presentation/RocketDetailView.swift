//
//  RocketDetailView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketDetailView: View {
    let store: StoreOf<RocketDetailDomain>
    let rocket: Rocket
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView {
                VStack(alignment: .leading) {
                    RocketParametersView(store: store, rocket: rocket)
                    RocketFirstStageView(rocket: rocket)
                    RocketSecondStageView(rocket: rocket)
                    RocketPhotosView(rocket: rocket)
                }
            }
        }
    }
}

//struct RocketDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RocketDetailView(store: Store<RocketDetailDomain.State, RocketDetailDomain.Action>)
//    }
//}
