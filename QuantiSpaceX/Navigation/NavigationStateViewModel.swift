//
//  NavigationStateViewModel.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 20.02.2025.
//

import Foundation

class NavigationStateViewModel: ObservableObject {
    @Published var currentView = DifferentViews.HomeView
    
    func onViewChanged(newView: DifferentViews) {
        self.currentView = newView
    }
}

enum DifferentViews {
    case HomeView
    case DetailView
    case LaunchView
}
