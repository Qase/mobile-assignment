//
//  RocketsViewModel.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import Resolver
import SharedDomain
import SwiftUI
import UIToolkit
import Utilities

// MARK: - State

extension RocketsViewModel {
    struct State {
        var rockets: [Rocket] = []
        var skeletonRocketsData: [Rocket] = []
        var isLoading = false
        var showEmptyView = false
        var alert: AlertData?
    }
}

// MARK: - View model

final class RocketsViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    // MARK: State
    @Published private(set) var state: State = State()
    
    // MARK: Dependencies
    private weak var flowController: FlowController?
    private var skeletonRocketsCount = 3
    
    @Injected private(set) var getRocketsUseCase: GetRocketsUseCase

    // MARK: Init
    init(flowController: FlowController?) {
        self.flowController = flowController
        super.init()
    }
     
    // MARK: Lifecycle
    override func onAppear() {
        setupHistoryProductsSkeleton()
        
        executeTask(Task {
            await fetchData()
        })
    }
    
    // MARK: Intent
    enum Intent {
        case showDetail(String)
        case dismissAlert
    }

    func onIntent(_ intent: Intent) {
        executeTask(Task {
            switch intent {
            case let .showDetail(rocketId): showDetail(for: rocketId)
            case .dismissAlert: dismissAlert()
            }
        })
    }
    
    // MARK: Private
    private func fetchData() async {
        state.isLoading = true
        defer { state.isLoading = false }
        
        do {
            state.rockets = try await getRocketsUseCase.execute(page: 0)
            state.showEmptyView = state.rockets.isEmpty
        } catch {
            state.showEmptyView = true
            state.alert = .init(title: Strings.errorDataLoadTitle)
        }
    }
    
    private func showDetail(for rocketId: String) {
        flowController?.handleFlow(RocketsFlow.rockets(.showRocketDetail(rocketId)))
    }
    
    private func dismissAlert() {
        state.alert = nil
    }
}

// MARK: - Skeletons

private extension RocketsViewModel {
    
    func setupHistoryProductsSkeleton() {
        state.skeletonRocketsData = (0...skeletonRocketsCount).map { index -> Rocket in
            Rocket(
                id: "",
                name: "Falcon",
                description: "Rocket short description",
                wikipedia: "",
                active: true,
                stages: 2,
                boosters: 2,
                costPerLaunch: 234,
                successRatePct: 2,
                firstFlight: "2022-02-23 15:00:00",
                country: "",
                company: "",
                flickrImages: [],
                firstStage: RocketFirstStage(
                    reusable: true,
                    engines: 4,
                    fuelAmountTons: 2443,
                    burnTimeSec: 12456
                ),
                secondStage: RocketSecondStage(
                    reusable: true,
                    engines: 67,
                    fuelAmountTons: 45567,
                    burnTimeSec: 234565
                ),
                height: RocketHeight(meters: 23.5, feet: 14.0),
                diameter: RocketDiameter(meters: 12.2, feet: 39.9),
                mass: RocketMass(kg: 1234, lb: 123)
            )
        }
    }
}


