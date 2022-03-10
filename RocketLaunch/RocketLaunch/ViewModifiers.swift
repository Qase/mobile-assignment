//
//  ViewModifiers.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 24.02.2022.
//

import Foundation
import SwiftUI

struct subsectionHeddingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .multilineTextAlignment(TextAlignment.leading)
    }
}

struct textBlockStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.body)
            .foregroundColor(.gray)
            .multilineTextAlignment(TextAlignment.leading)
    }
}
