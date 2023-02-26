//
//  RocketListView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketListView: View {
    let store: StoreOf<RocketListDomain>
    
    var body: some View {
        WithViewStore(self.store, observe: \.rocketItems) { viewStore in
            VStack(alignment: .leading) {
                Text("Rockets")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 25)
                
                NavigationStack {
                    List {
                        ForEachStore(
                            self.store.scope(state: \.rocketItems,
                                             action: RocketListDomain.Action.rockets(id:action:))) { rocket in
                                                 NavigationLink(destination: {
                                                     RocketDetailView(store: rocket)
                                                 }, label: {
                                                     RocketListPartView(store: rocket)
                                                 })
                                             }
                    }
                }.task {
                    viewStore.send(.onAppear)
                }
            }
        }
    }
}

//struct RocketListView_Previews: PreviewProvider {
//    static var previews: some View {
//        RocketListView(store: Store<RocketDetailDomain.State, RocketDetailDomain.Action>)
//    }
//}
