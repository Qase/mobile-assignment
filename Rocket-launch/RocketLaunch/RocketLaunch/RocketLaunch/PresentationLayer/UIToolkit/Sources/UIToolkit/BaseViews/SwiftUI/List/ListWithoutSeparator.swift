//
//  ListWithoutSeparator.swift
//  
//
//  Created by Tomáš Brand on 13.03.2023.
//

import SwiftUI

public struct ListWithoutSeparator<Content>: View where Content: View {
    
    // MARK: - Stored Properties
    
    let content: Content

    // MARK: - Init

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        
        // A little workaround for remove background color
        UICollectionView.appearance().backgroundColor = .clear
    }

    // MARK: - Body and views

    public var body: some View {
        List {
            content
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .listRowBackground(AppTheme.Colors.bgGradientDark.opacity(0))
        }
        .listStyle(.plain)
    }
}

struct ListWithoutSeparator_Previews: PreviewProvider {
    static var previews: some View {
        ListWithoutSeparator {
            VStack {
                Text("Test 1")
            }
            
            VStack {
                Text("Test 2")
            }
        }
        .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        .previewDisplayName("iPhone 8 (15.0)")
    }
}

