//
//  RocketDetailView.swift
//  
//
//  Created by Tomáš Brand on 15.03.2023.
//

import SwiftUI
import UIToolkit

struct RocketDetailView: View {
    
    // MARK: - Stored properties
    
    @ObservedObject private var viewModel: RocketDetailViewModel
    
    private let contentYOffset: CGFloat = -32
   
    // MARK: - Init
    
    init(viewModel: RocketDetailViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body and views
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            GeometryReader { geo in
                HeaderImage(
                    url: viewModel.state.rocket?.flickrImages.first ?? "",
                    geo: geo,
                    height: getHeightForHeaderImage(geo),
                    offset: getOffsetForHeaderImage(geo),
                    onPhotoButtonTap: { viewModel.onIntent(.presentPhotos) }
                )
            }
            .frame(height: Dimension.tallHeaderImage)
            
            VStack {
                if let rocket = viewModel.state.rocket {
                    RocketDetailContentView(rocket: rocket)
                        .backgroundStyle(.mainBackground)
                        .roundedCorner(Dimension.radiusXLarge, corners: [.topLeft, .topRight])
                }
            }
            .skeleton(viewModel.state.isLoading)
            .padding(.top, contentYOffset)
            .animateContent(!viewModel.state.isLoading, transition: .move(edge: .bottom))
        }
        .padding(.bottom, Dimension.paddingXXXLarge)
        .backgroundStyle(.mainBackground)
        .edgesIgnoringSafeArea(.all)
        .lifecycle(viewModel)
        .navigationBarBackButtonHidden(true)
        
        .navigationBarItems(
            leading:
                Button("") {
                    viewModel.onIntent(.dismiss)
                }
                .buttonStyle(BackButtonStyle())
        )
        
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(Strings.rocketLaunchButtonTitle) {
                    viewModel.onIntent(.showLaunch)
                }
                .buttonStyle(LaunchButtonStyle())
            }
        }
        
        .toastView(Binding<ToastData?>(
            get: { viewModel.state.toastData },
            set: { _ in viewModel.onIntent(.dismissToast) }
        ))
        
        .alert(item: Binding<AlertData?>(
            get: { viewModel.state.alert },
            set: { _ in viewModel.onIntent(.dismissAlert) }
        )) { alertData in .init(alertData) }
    }
}

// MARK: - Private methods

private extension RocketDetailView {
    private func getScrollOffset(_ geo: GeometryProxy) -> CGFloat {
        geo.frame(in: .global).minY
    }
        
    private func getOffsetForHeaderImage(_ geo: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geo)
        
        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    private func getHeightForHeaderImage(_ geo: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geo)
        let imageHeight = geo.size.height

        if offset > 0 {
            return imageHeight + offset
        }

        return imageHeight
    }
}

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailView(
            viewModel: RocketDetailViewModel(
                rocketId: "",
                flowController: nil
            )
        )
    }
}
