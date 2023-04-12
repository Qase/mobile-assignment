//
//  HeadlineText.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import SwiftUI

public struct HeadlineText: View {
    
    // MARK: - Stored Properties
    
    private let font: Font
    private let content: String
    
    // MARK: - Init
    
    public init(
        font: Font,
        _ content: String
    ) {
        self.font = font
        self.content = content
    }
    
    // MARK: - Body and views
    
    public var body: some View {
        Text(content)
            .font(font)
            .foregroundColor(AppTheme.Colors.text)
    }
}

struct HeadlineText_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineText(font: AppTheme.Fonts.headlineText, "Lorem Ipsum")
    }
}
