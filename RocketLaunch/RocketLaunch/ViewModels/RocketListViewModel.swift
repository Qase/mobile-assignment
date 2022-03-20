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
    
    private var subscriptions = Set<AnyCancellable>()
    private var rocketsSubscriptions = Set<AnyCancellable>()
    
    @Published public var fetching: Bool = false
    @Published public var rockets: [Rocket] = []
    
    init(
        rocketsService: APIServiceDataPublisher = RocketsService()
    ) {
        self.rocketsService = rocketsService
        
        $rockets
            .map{ _ in false }
            .assign(to: \.fetching, on: self)
            .store(in: &subscriptions)
    }
    
    public func fetchRockets() {
        fetching = true
        
        print("FETCH ROCKETS")
        rocketsService.publisher()
            .retry(1)
            .decode(type: [Rocket].self, decoder: Self.decoder)
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: \.rockets, on: self)
            .store(in: &rocketsSubscriptions)
    }
}
