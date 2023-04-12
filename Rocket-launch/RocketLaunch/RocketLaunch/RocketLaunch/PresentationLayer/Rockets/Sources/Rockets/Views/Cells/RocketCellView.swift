//
//  RocketCellView.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

import SwiftUI
import UIToolkit
import Utilities

struct RocketCellView: View {
    
    // MARK: - Stored properties
    
    private let title: String
    private let text: String
    
    private let cellBackgroundHeight: CGFloat = 60
    
    // MARK: - Init
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    // MARK: - Body and views
    
    var body: some View {
        HStack {
            HStack(spacing: Dimension.spaceMedium) {
                AppTheme.Images.rocketIcon
                
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(AppTheme.Colors.text)
                        .font(AppTheme.Fonts.bodyTextBold)
                    
                    Text(createDateSubtitle())
                        .foregroundColor(AppTheme.Colors.text)
                        .font(AppTheme.Fonts.bodyTextSmall)
                }
            }
            
            Spacer()
            AppTheme.Images.chevronRightIcon
        }
        .padding(.horizontal)
        .backgroundStyle(
            .cellBackgroundStyle(
                UIScreen.main.bounds.width - Dimension.spaceXLarge,
                cellBackgroundHeight
            )
        )
    }
    
    // MARK: - Private methods
    
    private func createDateSubtitle() -> String {
        let date = text.toDate(formatter: Formatter.Date.plain)
        let formattedString = date?.toString(formatter: Formatter.Date.formatted) ?? ""
        return Strings.rocketCellSubtitle(formattedString)
    }
}

struct RocketCellView_Previews: PreviewProvider {
    static var previews: some View {
        RocketCellView(title: "Falcon", text: "First flyght: 24.3. 2006")
    }
}
