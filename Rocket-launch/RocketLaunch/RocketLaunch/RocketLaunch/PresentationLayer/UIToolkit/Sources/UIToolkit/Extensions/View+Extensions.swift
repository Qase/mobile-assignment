//
//  View+Extensions.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import SwiftUI

@MainActor
public extension View {
    @inlinable func lifecycle(_ viewModel: BaseViewModel) -> some View {
        self
            .onAppear {
                viewModel.onAppear()
            }
            .onDisappear {
                viewModel.onDisappear()
            }
    }
}

public extension View {
    /// Redact a view with a shimmering effect aka show a skeleton.
    /// - Inspiration taken from [Redacted View Modifier](https://www.avanderlee.com/swiftui/redacted-view-modifier/)
    @ViewBuilder
    func skeleton(
        _ condition: @autoclosure () -> Bool,
        duration: Double = 1.5,
        bounce: Bool = false
    ) -> some View {
        redacted(reason: condition() ? .placeholder : [])
            .shimmering(active: condition(), duration: duration, bounce: bounce)
    }
    
    /// Adding animation to loaded content after skeleton loading disappears.
    ///
    /// - Parameter animate: `Bool` value triggering the animation
    /// - Returns: View
    func animateContent(_ animate: Bool, transition: AnyTransition = .opacity) -> some View {
        modifier(AnimatedContentModifier(animate: animate, transition: transition))
    }
}

public extension View {
    /// ViewModifier for show toast with information
    ///
    /// - Parameter toastData: Toast data to show
    /// - Returns: View
    func toastView(_ toastData: Binding<ToastData?>) -> some View {
        modifier(ToastViewModifier(toastData: toastData))
    }
 }

public extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

public extension View {
    /// Rounded corner modifier allows set concrete conrers.
    ///
    /// - Parameters:
    ///   - radius: Radius value for chosen rounded corners.
    ///   - corners: Array of corners which are chosen for settings of rounded corners.
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
