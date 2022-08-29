//
//  RocketListViewModel.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 18.02.2022.
//

import Foundation
import Combine

// MARK: - Rocket List View Model

//@MainActor
class RocketListViewModel: ObservableObject, LoadableObject {
//    private static let decoder = JSONDecoder()
//    private let rocketsService: APIServiceDataPublisher
//    private var cancellable: AnyCancellable?
    
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
    
//    public func fetchRockets() {
//        state = .loading
//
//        cancellable = rocketsService.publisher()
//            .decode(type: [Rocket].self, decoder: Self.decoder)
//            .receive(on: DispatchQueue.main)
//            .map(LoadingState<[Rocket]>.loaded)
//            .catch { Just(LoadingState.failed($0)) }
//            .sink { [weak self] state in
//                self?.state = state
//            }
//    }
}
