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
    private static let decoder = JSONDecoder()
    private let rocketsService: APIServiceDataPublisher
    private var cancellable: AnyCancellable?
    
    @Published private(set) var state: LoadingState<[Rocket]>
    @Published public var fetching: Bool = false

    private let service: APIDataServiceProviderProtocol

    init(
        rocketsService: APIServiceDataPublisher = RocketsService(),
        state: LoadingState<[Rocket]> = .idle,
        service: APIDataServiceProviderProtocol = DIContainer.shared.apiDataMockProviderService
    ) {
        self.rocketsService = rocketsService
        self.state = state
        self.service = service
    }
    
    func load() {
        state = .loaded(service.getRocketList())
//        fetchRockets()
    }
    
    public func fetchRockets() {
        state = .loading

        cancellable = rocketsService.publisher()
            .decode(type: [Rocket].self, decoder: Self.decoder)
            .receive(on: DispatchQueue.main)
            .map(LoadingState<[Rocket]>.loaded)
            .catch { Just(LoadingState.failed($0)) }
            .sink { [weak self] state in
                self?.state = state
            }
    }
}
