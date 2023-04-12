//
//  AppFlowController.swift
//  RocketLaunch
//
//  Created by Tomáš Brand on 11.03.2023.
//

import Resolver
import SharedDomain
import UIToolkit
import UIKit
import Rockets

final class AppFlowController: FlowController {
    
    func start() {
        setupAppearance()
        showSplashScreen()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.setupMain()
        }
    }
    
    func setupMain() {
        let fc = RocketsFlowController(navigationController: navigationController)
       // fc.delegate = self
        let rootVC = startChildFlow(fc)
        navigationController.viewControllers = [rootVC]
    }
    
    private func showSplashScreen() {
        let vc = BaseHostingController(rootView: SplashScreenView())
        navigationController.viewControllers = [vc]
    }
    
    private func setupAppearance() {
        // Navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(AppTheme.Colors.navBarTitle)]
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor(AppTheme.Colors.navBarTitle)

        // Tab bar
        UITabBar.appearance().tintColor = UIColor(AppTheme.Colors.mainPink)

        // UITextField
        UITextField.appearance().tintColor = UIColor(AppTheme.Colors.mainPink)
    }
}

