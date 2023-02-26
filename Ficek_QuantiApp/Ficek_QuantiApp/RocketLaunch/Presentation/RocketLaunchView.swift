//
//  RocketLaunchView.swift
//  Ficek_QuantiApp
//
//  Created by Martin Ficek on 24.02.2023.
//

import SwiftUI
import ComposableArchitecture

struct RocketLaunchView: View {
    let store: StoreOf<RocketLaunchDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

//struct RocketLaunchView_Previews: PreviewProvider {
//    static var previews: some View {
//        RocketLaunchView()
//    }
//}
