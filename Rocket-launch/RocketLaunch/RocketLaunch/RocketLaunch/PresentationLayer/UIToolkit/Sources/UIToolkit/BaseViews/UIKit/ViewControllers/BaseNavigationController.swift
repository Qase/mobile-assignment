//
//  BaseNavigationController.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

import UIKit

public final class BaseNavigationController: UINavigationController {
    
    private var statusBarStyle: UIStatusBarStyle = .default
    
    public convenience init(statusBarStyle: UIStatusBarStyle) {
        self.init(nibName: nil, bundle: nil)
        self.statusBarStyle = statusBarStyle
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}
