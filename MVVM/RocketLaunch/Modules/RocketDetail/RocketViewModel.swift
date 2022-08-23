//
//  RocketViewModel.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 24.02.2022.
//

import Foundation

class RocketViewModel: ObservableObject, LoadableObject {
    @Published private(set) var state: LoadingState<RocketDetail>
    let rocketID: String
    
    init(
        rocketID: String,
        state: LoadingState<RocketDetail> = .idle
    ) {
        self.rocketID = rocketID
        self.state = state
    }

    func load() {

    }
}
