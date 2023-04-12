//
//  RocketDetailViewModel.swift
//  
//
//  Created by Tomáš Brand on 18.03.2023.
//

import Resolver
import SharedDomain
import SwiftUI
import UIToolkit
import Utilities

// MARK: - State

extension RocketDetailViewModel {
    struct State {
        var rocket: Rocket?
        var rocketPhotos: [Image] = []
        var isLoading = false
        var alert: AlertData?
        var toastData: ToastData?
    }
}

// MARK: - View model

final class RocketDetailViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    // MARK: State
    @Published private(set) var state: State = State()
    
    // MARK: Dependencies
    private let rocketId: String
    private weak var flowController: FlowController?
    
    @Injected private(set) var getRocketUseCase: GetRocketUseCase

    // MARK: Init
    init(rocketId: String, flowController: FlowController?) {
        self.rocketId = rocketId
        self.flowController = flowController
        super.init()
        
        onDidLoad()
    }
     
    // MARK: Lifecycle
    
    private func onDidLoad() {
        executeTask(Task {
            await fetchData()
        })
    }
    
    // MARK: Intent
    enum Intent {
        case showLaunch
        case presentPhotos
        case dismissAlert
        case dismissToast
        case dismiss
    }

    func onIntent(_ intent: Intent) {
        executeTask(Task {
            switch intent {
            case .showLaunch: showLaunch()
            case .presentPhotos: presentPhotos()
            case .dismissAlert: dismissAlert()
            case .dismissToast: dismissToast()
            case .dismiss: dismiss()
            }
        })
    }
    
    // MARK: Private
    private func fetchData() async {
        state.isLoading = true
        defer { state.isLoading = false }
        
        do {
            state.rocket = try await getRocketUseCase.execute(id: rocketId)
            guard let imageUrls = state.rocket?.flickrImages else { return }
            getPhotos(from: imageUrls)
        } catch {
            state.alert = .init(title: Strings.errorDataLoadTitle)
        }
    }
    
    private func getPhotos(from urls: [String]) {
        for imageUrl in urls {
            guard let url = URL(string: imageUrl) else { return }
            UIImage.loadFrom(url: url) { image in
                guard let image else { return }
                self.state.rocketPhotos.append(Image(uiImage: image))
            }
        }
    }
    
    private func presentPhotos() {
        guard !state.rocketPhotos.isEmpty else {
            state.toastData = .init(error: Strings.emptyPhotosErrorTitle)
            return
        }
        flowController?.handleFlow(RocketDetailFlow.detail(.presentPhotos(state.rocketPhotos)))
    }
    
    private func showLaunch() {
        flowController?.handleFlow(RocketDetailFlow.detail(.launch))
    }
    
    private func dismiss() {
        flowController?.navigationController.popToRootViewController(animated: true)
    }
    
    private func dismissAlert() {
        state.alert = nil
    }
    
    private func dismissToast() {
        state.toastData = nil
    }
}

