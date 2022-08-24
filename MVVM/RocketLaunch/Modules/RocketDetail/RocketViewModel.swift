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

    private let service: APIDataServiceProviderProtocol
    
    init(
        rocketID: String,
        state: LoadingState<RocketDetail> = .idle,
        service: APIDataServiceProviderProtocol = DIContainer.shared.apiDataMockProviderService
    ) {
        self.rocketID = rocketID
        self.state = state
        self.service = service
    }

    func load() {
        if let result = service.getRocketDetail(id: rocketID) {
            state = .loaded(result)
        } else {
            state = .failed(APIError.rocketNotFound)
        }

    }
}
