//
//  AsyncContentView.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 24.03.2022.
//

import SwiftUI

struct AsyncContentView<Source: LoadableObject, Content: View>: View {
    @ObservedObject var source: Source
    var content: (Source.Output) -> Content
    
    init(
        source: Source,
        @ViewBuilder content: @escaping (Source.Output) -> Content
    ) {
           self.source = source
           self.content = content
    }

    var body: some View {
        switch source.state {
        case .idle, .loading:
            ProgressView()
        case .failed(let error):
            Text(error.localizedDescription)
            //ErrorView(error: error, retryHandler: source.load)
        case .loaded(let output):
            content(output)
        }
    }
}
/*
struct AsyncContentView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncContentView(source: <#_#>, content: <#(_) -> _#>)
    }
}
*/
