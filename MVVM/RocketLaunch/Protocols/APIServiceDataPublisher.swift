//
//  APIServiceDataPublisher.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 24.02.2022.
//

import Foundation
import Combine

public protocol APIServiceDataPublisher {
    func publisher() -> AnyPublisher<Data, URLError>
}
