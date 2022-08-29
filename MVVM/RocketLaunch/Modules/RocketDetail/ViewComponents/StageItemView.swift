//
//  StageItemView.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import SwiftUI

// MARK: - Stage Item View

struct StageItemView: View {
    var spacingInParts: CGFloat = 10

    let image: Icons
    let text: String

    var body: some View {
        HStack(spacing: spacingInParts) {
            image.image
            Text(text)
        }
    }
}

// MARK: StageItemView Preview

struct StageItemView_Previews: PreviewProvider {
    static var previews: some View {
        StageItemView(
            image: Icons.burn,
            text: "Burn"
        )
    }
}
