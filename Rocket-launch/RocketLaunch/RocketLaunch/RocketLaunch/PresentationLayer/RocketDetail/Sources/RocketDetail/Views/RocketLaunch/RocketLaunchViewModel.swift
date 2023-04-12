//
//  RocketLaunchViewModel.swift
//  
//
//  Created by Tomáš Brand on 01.04.2023.
//

import Resolver
import SharedDomain
import SwiftUI
import UIToolkit
import Utilities
import CoreMotion

// MARK: - State

extension RocketLaunchViewModel {
    struct State {
        var canStart = false
        var rocketImage: Image = AppTheme.Images.rocketIdleIcon
        var rocketStartPosition: CGFloat = 150
        var rocketOrbitPosition: CGFloat = -150
        var toastData: ToastData?
    }
}

// MARK: - View model

final class RocketLaunchViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    // MARK: State
    @Published private(set) var state: State = State()
    
    // MARK: Dependencies
    private weak var flowController: FlowController?
    private var manager: CMMotionManager
    
    @Injected private(set) var getRocketUseCase: GetRocketUseCase

    // MARK: Init
    init(flowController: FlowController?) {
        self.manager = CMMotionManager()
        self.flowController = flowController
        super.init()
    }
     
    // MARK: Lifecycle
    override func onAppear() {
        super.onAppear()
        
        startMotionUpdatesForRocketStart()
    }
    
    // MARK: Intent
    enum Intent {
        case dismiss
        case dismissToast
    }

    func onIntent(_ intent: Intent) {
        executeTask(Task {
            switch intent {
            case .dismiss: dismiss()
            case .dismissToast: dismissToast()
            }
        })
    }
    
    // MARK: Private
    private func startMotionUpdatesForRocketStart() {
        manager.deviceMotionUpdateInterval = 0.01
        manager.startDeviceMotionUpdates(to: .main) { [weak self] (motion, error) in
            guard error == nil, let motion else { return }
            if (motion.attitude.pitch * 180.0 / Double.pi) > 70 {
                self?.startRocket()
                self?.manager.stopDeviceMotionUpdates()
            }
        }
    }
    
    private func startRocket() {
        state.rocketImage = AppTheme.Images.rocketFlyingIcon
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.state.canStart = true
            self.state.toastData = .init(Strings.rocketLaunchToastTitle)
        }
    }
    
    private func resetData() {
        state.canStart = false
        state.rocketImage = AppTheme.Images.rocketIdleIcon
        startMotionUpdatesForRocketStart()
    }
    
    private func dismiss() {
        flowController?.navigationController.popViewController(animated: true)
    }
    
    private func dismissToast() {
        state.toastData = nil
        resetData()
    }
}
