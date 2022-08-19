//
//  rocketLaunchApp.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 25.01.2022.
//

import SwiftUI

@main
struct rocketLaunchApp: App {
    var body: some Scene {
        WindowGroup {
            RocketListView(viewModel: mock)
        }
    }
}

let mock = RocketListViewModel(state: LoadingState<[Rocket]>.loaded([]))
