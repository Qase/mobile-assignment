//
//  ErrorView.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 25.03.2022.
//

import SwiftUI

// MARK: - Error View
struct CustomErrorView: View {
    var title: String = "Error"
    var description: String? = "Something went wrong.."
    
    init(
        title: String,
        desctiption: String? = nil
    ) {
        self.title = title
        self.description = desctiption
    }
    
    var body: some View {
        VStack {
            Text(title)
            if let description = description {
                Text(description)
            }
        }
    }
}

// MARK: - Error View Preview
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CustomErrorView(title: "Error title")
    }
}
