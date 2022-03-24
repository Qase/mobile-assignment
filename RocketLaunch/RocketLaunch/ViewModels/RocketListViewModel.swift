//
//  RocketListViewModel.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 18.02.2022.
//

import Foundation
import Combine

public final class RocketListViewModel: ObservableObject {
    private static let decoder = JSONDecoder()
    private let rocketsService: APIServiceDataPublisher
    private var cancellable: AnyCancellable?
    
    @Published private(set) var state = LoadingState.idle
    @Published public var fetching: Bool = false
    
    init(
        rocketsService: APIServiceDataPublisher = RocketsService()
    ) {
        self.rocketsService = rocketsService
    }
    
    public func fetchRockets() {
        state = .loading

        cancellable = rocketsService.publisher()
            .decode(type: [Rocket].self, decoder: Self.decoder)
            .receive(on: DispatchQueue.main)
            .map(LoadingState.loaded)
            .catch { Just(LoadingState.failed($0)) }
            .sink { [weak self] state in
                self?.state = state
            }
    }
    
    enum LoadingState {
        case idle
        case loading
        case failed(Error)
        case loaded([Rocket])
    }
}

