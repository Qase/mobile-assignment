//
//  BaseHostingController.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import OSLog
import SwiftUI
import Utilities

public class BaseHostingController<Content>: UIHostingController<Content> where Content: View {
    
    override public init(rootView: Content) {
        super.init(rootView: rootView)
        Logger.lifecycle.info("\(type(of: self)) initialized")
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Logger.lifecycle.info("\(type(of: self)) initialized")
        setupUI()
    }
    
    deinit {
        Logger.lifecycle.info("\(type(of: self)) deinitialized")
    }
    
    private func setupUI() {
        // Setup background color and back button title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
