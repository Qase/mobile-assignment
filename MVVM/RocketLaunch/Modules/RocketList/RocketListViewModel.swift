//
//  RocketListViewModel.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 18.02.2022.
//

import Foundation
import Combine

// MARK: - Rocket List View Model

class RocketListViewModel: ObservableObject, LoadableObject {
    @Published private(set) var state: LoadingState<[Rocket]>

    private let service: APIDataServiceProviderProtocol

    init(
        state: LoadingState<[Rocket]> = .idle,
        service: APIDataServiceProviderProtocol = DIContainer.shared.apiDataServiceProvider
    ) {
        self.state = state
        self.service = service
    }
    
    func load() async {
        self.state = .loading

        do {
            let rockets = try await service.getRocketList() // TODO: verify whether there is
            self.state = .loaded(rockets)
        } catch {
            self.state = .failed(error)
        }
    }
}
