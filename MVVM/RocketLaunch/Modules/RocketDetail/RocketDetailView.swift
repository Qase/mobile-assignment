//
//  RocketDetailView.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 24.02.2022.
//

import SwiftUI

// MARK: - Rocket View

struct RocketDetailView: View {
    let viewModel: RocketViewModel

    var spacingInParts: CGFloat = 10
    var spacingBetweenParts: CGFloat = 20

    var body: some View {
        AsyncContentView(source: viewModel) { rocketDetail in
            loadedView(rocket: rocketDetail)
        }
        .onAppear {
            viewModel.load()
        }
    }

    func loadedView(rocket: RocketDetail) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: spacingBetweenParts) {
                overviewPart(rocket: rocket)
                parametersPart(rocket: rocket)
                stagePart(title: .RocketDetail.Stage.title1, stage: rocket.firstStage)
                stagePart(title: .RocketDetail.Stage.title2, stage: rocket.secondStage)
                imagesPart(rocket: rocket)
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: RocketLaunchViewBuilder.make() ) {
                        Text(.RocketDetail.launch)
                    }
                }
            }
            .navigationBarTitle(rocket.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: Subviews

    func overviewPart(rocket: RocketDetail) -> some View {
        VStack(alignment: .leading, spacing: spacingInParts) {
            Text(.RocketDetail.overviewTitle)
                .modifier(subsectionHeddingStyle())
            Text(rocket.description)
                .fixedSize(horizontal: false, vertical: true)
        }
        .multilineTextAlignment(.leading)
    }

    func parametersPart(rocket: RocketDetail) -> some View {
        VStack(alignment: .leading, spacing: spacingInParts) {
            Text(.RocketDetail.Parameters.title)
                .modifier(subsectionHeddingStyle())

            HStack {
                RectangleView(
                    textTop: rocket.getParameter(type: .height)?.name ?? "nil",
                    textBottom: .RocketDetail.Parameters.height
                )
                RectangleView(
                    textTop: rocket.getParameter(type: .diameter)?.name ?? "nil",
                    textBottom: .RocketDetail.Parameters.diameter
                )
                RectangleView(
                    textTop: rocket.getParameter(type: .mass)?.name ?? "nil",
                    textBottom: .RocketDetail.Parameters.mass
                )
            }
        }
    }

    func stagePart(title: LocalizedStringKey, stage: Stage) -> some View {
        // TODO: Add plurals to localizable

        VStack(alignment: .leading, spacing: spacingInParts) {
            Text(title)
                .modifier(subsectionHeddingStyle())

            VStack(alignment: .leading, spacing: spacingInParts) {
                StageItemView(
                    image: Icons.reusable,
                    text: stage.reusable ? "reusable" : "not reusable"
                )
                StageItemView(
                    image: Icons.engine,
                    text: stage.engines > 1 ? "\(stage.engines) engine" : "\(stage.engines) engines"
                )
                StageItemView(
                    image: Icons.fuel,
                    text: stage.fuelAmount == 1 ? "\(stage.fuelAmount) ton of fuel" : "\(stage.fuelAmount) tons of fuel"
                )
                StageItemView(
                    image: Icons.burn,
                    text: stage.burnTime > 1 ? "\(stage.burnTime) seconds burn time" : "\(stage.burnTime) second burn time"
                )
            }
            .padding(.horizontal, 20)
        }
    }

    func imagesPart(rocket: RocketDetail) -> some View {
        VStack {
            Text(.RocketDetail.photosTitle)
                .modifier(subsectionHeddingStyle())

            ForEach(rocket.photos, id: \.self) {
                if let url = URL(string: $0.stringURL) {
                    ImageView(url: url)
                }
            }
        }
    }
}


// MARK: - RocketDetailView Preview

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return RocketDetailView(viewModel: RocketViewModel(rocketID: RocketDetail.falcon9.id))
    }
}

// MARK: - RocketLauchView builder
// source: https://stackoverflow.com/questions/61238773/how-can-i-initialize-view-again-in-swiftui

final class RocketLaunchViewBuilder {
    static func make() -> some View {
        DeferView {
            RocketLaunchView(motionManager: MotionManager())
        }
    }
}

struct DeferView<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
    }
}
