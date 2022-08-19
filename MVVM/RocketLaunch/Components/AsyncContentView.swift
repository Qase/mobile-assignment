//
//  AsyncContentView.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.03.2022.
//  Async part inspiration: https://www.swiftbysundell.com/articles/handling-loading-states-in-swiftui/

import SwiftUI
import Combine

struct AsyncContentView<
    Source: LoadableObject,
                        ErrorView: View,
                        LoadingView: View,
                        Content: View>: View {
    @ObservedObject var source: Source
    var loadingView: () -> LoadingView
    var errorView: (Error) -> ErrorView
    var content: (Source.Output) -> Content

    var body: some View {
        switch source.state {
        case .idle, .loading:
            loadingView()
        case .failed(let error):
            errorView(error)
        case .loaded(let output):
            content(output)
        }
    }
}
// MARK: - Async Content View
typealias DefaultProgressView = ProgressView<EmptyView, EmptyView>
typealias DefaultErrorView = CustomErrorView

extension AsyncContentView where LoadingView == DefaultProgressView, ErrorView == DefaultErrorView {
    init(
        source: Source,
        @ViewBuilder content: @escaping (Source.Output) -> Content
    ) {
        self.init(source: source) {
            ProgressView()
        } errorView: { error in
            CustomErrorView(title: error.localizedDescription)
        } content: { output in
            content(output)
        }

    }
}

