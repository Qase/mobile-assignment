//
//  RocketDetailFlowController.swift
//  
//
//  Created by Tomáš Brand on 18.03.2023.
//

import SwiftUI
import UIKit
import UIToolkit

enum RocketDetailFlow: Flow, Equatable {
    case detail(RocketDetail)
    
    enum RocketDetail: Equatable {
        case presentPhotos([Image])
        case launch
    }
}

public protocol RocketDetailFlowControllerDelegate: AnyObject {}

public final class RocketDetailFlowController: FlowController {
    
    // MARK: - Stored properties
    
    private let rocketId: String
    
    public weak var delegate: RocketDetailFlowControllerDelegate?
    
    // MARK: - Init

    public init(
        rocketId: String,
        navigationController: UINavigationController
    ) {
        self.rocketId = rocketId
        super.init(navigationController: navigationController)
    }
    
    // MARK: - Setup
    
    override public func setup() -> UIViewController {
        let vm = RocketDetailViewModel(rocketId: rocketId, flowController: self)
        return BaseHostingController(rootView: RocketDetailView(viewModel: vm))
    }
    
    override public func handleFlow(_ flow: Flow) {
        guard let rocketsFlow = flow as? RocketDetailFlow else { return }
        switch rocketsFlow {
        case let .detail(rocketsFlow): handleRocketDetailFlow(rocketsFlow)
        }
    }
}

// MARK: Rocket detail flow
extension RocketDetailFlowController {
    func handleRocketDetailFlow(_ flow: RocketDetailFlow.RocketDetail) {
        switch flow {
        case let .presentPhotos(photos): presentPhotos(photos)
        case .launch: showLaunch()
        }
    }
    
    private func presentPhotos(_ images: [Image]) {
        let rootView = RocketPhotosView(images: images, dismiss: {
            self.navigationController.presentedViewController?.dismiss(animated: true)
        })
        let vc = BaseHostingController(rootView: rootView)
        vc.modalPresentationStyle = .fullScreen
        navigationController.present(vc, animated: true)
    }
    
    private func showLaunch() {
        let vm = RocketLaunchViewModel(flowController: self)
        let vc = BaseHostingController(rootView: RocketLaunchView(viewModel: vm))
        vc.title = Strings.rocketLaunchScreenTitle
        navigationController.show(vc, sender: nil)
    }
}

