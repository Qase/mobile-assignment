//
//  QuantiSpaceXApp.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import SwiftUI

@main
struct QuantiSpaceXApp: App {
    let viewModel = MainViewModel(apiClient: APIClient())
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}
