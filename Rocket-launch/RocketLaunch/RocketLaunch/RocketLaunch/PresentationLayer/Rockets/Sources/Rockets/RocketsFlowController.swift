//
//  File.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

import SwiftUI
import UIKit
import UIToolkit
import RocketDetail
import SharedDomain

enum RocketsFlow: Flow, Equatable {
    case rockets(Rockets)
    
    enum Rockets: Equatable {
        case showRocketDetail(String)
    }
}

public protocol RocketsFlowControllerDelegate: AnyObject {}

public final class RocketsFlowController: FlowController {
    
    // MARK: - Stored properties
    
    public weak var delegate: RocketsFlowControllerDelegate?
    
    // MARK: - Setup
    
    override public func setup() -> UIViewController {
        let vm = RocketsViewModel(flowController: self)
        return BaseHostingController(rootView: RocketsView(viewModel: vm))
    }
    
    override public func handleFlow(_ flow: Flow) {
        guard let rocketsFlow = flow as? RocketsFlow else { return }
        switch rocketsFlow {
        case let .rockets(rocketsFlow): handleRocketDetailFlow(rocketsFlow)
        }
    }
}

// MARK: Rocket detail flow

extension RocketsFlowController {
    func handleRocketDetailFlow(_ flow: RocketsFlow.Rockets) {
        switch flow {
        case let .showRocketDetail(rocket): showRocketDetail(rocket)
        }
    }
    
    private func showRocketDetail(_ id: String) {
        let fc = RocketDetailFlowController(rocketId: id, navigationController: navigationController)
        let rootVC = startChildFlow(fc)
        navigationController.show(rootVC, sender: nil)
    }
}
