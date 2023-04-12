//
//  RocketLaunchView.swift
//  
//
//  Created by Tomáš Brand on 01.04.2023.
//

import SwiftUI
import UIToolkit

struct RocketLaunchView: View {
    
    // MARK: - Stored properties
    
    @ObservedObject private var viewModel: RocketLaunchViewModel
    
    private let rocketVStackHeight = UIScreen.main.bounds.height / 1.5
    private let hStackMinHeight: CGFloat = 50
    private let hStackMaxHeight: CGFloat = 100
    private let cellBackgroundHeight: CGFloat = 60
    private let cellBackgroundWidth = UIScreen.main.bounds.width - 32
   
    // MARK: - Init
    
    init(viewModel: RocketLaunchViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body and views
    
    var body: some View {
        VStack {
            VStack {
                viewModel.state.rocketImage
                    .animation(.linear.speed(0.5), value: viewModel.state.canStart)
                    .transition(.move(edge: .bottom))
                    .offset(
                        y: viewModel.state.canStart
                            ? viewModel.state.rocketOrbitPosition
                            : viewModel.state.rocketStartPosition
                    )
            }
            .frame(height: rocketVStackHeight)
            
            VStack {
                Spacer()
                
                HStack {
                    AppTheme.Images.infoIcon
                        .foregroundColor(AppTheme.Colors.mainPink)
                    
                    Text(Strings.rocketLaunchInfoText)
                        .foregroundColor(AppTheme.Colors.text)
                        .font(AppTheme.Fonts.bodyTextBold)
                }
                .frame(minHeight: hStackMinHeight, maxHeight: hStackMaxHeight)
                .backgroundStyle(.cellBackgroundStyle(cellBackgroundWidth, cellBackgroundHeight))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundStyle(.mainBackground)
        .lifecycle(viewModel)
        .navigationBarBackButtonHidden(true)
        
        .navigationBarItems(
            leading:
                Button("") {
                    viewModel.onIntent(.dismiss)
                }
                .buttonStyle(BackButtonStyle())
        )
        
        .toastView(Binding<ToastData?>(
            get: { viewModel.state.toastData },
            set: { _ in viewModel.onIntent(.dismissToast) }
        ))
    }
}

struct RocketLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        RocketLaunchView(viewModel: RocketLaunchViewModel(flowController: nil))
    }
}
