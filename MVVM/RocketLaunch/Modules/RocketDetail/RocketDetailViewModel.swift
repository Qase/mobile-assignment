//
//  RocketDetailViewModel.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 24.02.2022.
//

import Foundation

class RocketDetailViewModel: ObservableObject, LoadableObject {
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

    func load() async {
        do {
            let rocketDetail = try await service.getRocketDetail(id: rocketID)
            self.state = .loaded(rocketDetail)
        } catch {
            self.state = .failed(error)
        }
    }

}
