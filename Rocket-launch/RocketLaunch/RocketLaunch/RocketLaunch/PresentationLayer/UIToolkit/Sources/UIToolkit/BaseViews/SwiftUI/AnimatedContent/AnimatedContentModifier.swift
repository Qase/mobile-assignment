//
//  AnimatedContentModifier.swift
//  
//
//  Created by Tomáš Brand on 08.04.2023.
//

import SwiftUI

public struct AnimatedContentModifier: ViewModifier {
    
    // MARK: - Stored properties
    
    private var animate: Bool
    private var transition: AnyTransition
    
    // MARK: - Init
    
    init(
        animate: Bool,
        transition: AnyTransition
    ) {
        self.animate = animate
        self.transition = transition
    }

    // MARK: - Body and views
    
    public func body(content: Content) -> some View {
        content
            .transition(transition)
            .animation(.easeInOut, value: animate)
    }
}
