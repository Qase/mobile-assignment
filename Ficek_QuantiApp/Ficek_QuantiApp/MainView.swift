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
            store: Store(initialState: RocketDetailDomain.State(), reducer: RocketDetailDomain())
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
