//
//  MainView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    var body: some View {
        RocketListView(
            store: Store(initialState: RocketListDomain.State(), reducer: RocketListDomain()._printChanges())
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
