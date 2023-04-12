//
//  File.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import SwiftUI

public extension LinearGradient {
    static var `default`: LinearGradient {
        self.init(
            gradient: Gradient(
                colors: AppTheme.Colors.bgGradient
            ),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
    }
    
    static var inverse: LinearGradient {
        self.init(
            gradient: Gradient(
                colors: AppTheme.Colors.bgGradient
            ),
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
    }
}
