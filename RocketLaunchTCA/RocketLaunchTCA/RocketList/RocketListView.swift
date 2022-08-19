//
//  RocketListView.swift
//  RocketLaunchTCA
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import SwiftUI
import ComposableArchitecture

// MARK: - RocketList View

struct RocketListView: View {
    let store: Store<RocketListState, RocketListAction>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: RocketList Preview

struct RocketListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketListView(store: Store(
            initialState: RocketListState(),
            reducer: rocketListReducer,
            environment: RocketListEnvironment()
        ))
    }
}
