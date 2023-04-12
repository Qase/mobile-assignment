//
//  SwiftUIView.swift
//  
//
//  Created by Tomáš Brand on 26.03.2023.
//

import SwiftUI
import UIToolkit

struct StagePropertyCellView: View {
    
    // MARK: - Stored properties
    
    private let image: Image
    private let title: String
    
    // MARK: - Init
    
    init(image: Image, title: String) {
        self.image = image
        self.title = title
    }
    
    // MARK: - Body and views
    
    var body: some View {
        HStack(spacing: Dimension.spaceMedium) {
            image
            Text(title)
        }
    }
}

struct StagePropertyCellView_Previews: PreviewProvider {
    static var previews: some View {
        StagePropertyCellView(image: AppTheme.Images.rocketIcon, title: "")
    }
}
