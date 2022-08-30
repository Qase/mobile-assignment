//
//  RocketCell.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import SwiftUI

// MARK: - Rocket Cell

struct RocketCell: View {
    let rocket: Rocket

    var body: some View {
        HStack {
            Icons.rocket.image

            VStack(alignment: .leading) {
                Text(rocket.name)
                    .font(.headline)
                Text(.RocketList.firstFlight(date: rocket.firstFlight))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - RocketCell Preview

struct RocketCell_Previews: PreviewProvider {
    static var previews: some View {
        RocketCell(rocket: Rocket.falcon1)
    }
}
