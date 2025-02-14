//
//  MainView.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init(
        viewModel: MainViewModel
    ) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
          // Show initial page
            RocketListView(viewModel: viewModel)
        }
    }
}

