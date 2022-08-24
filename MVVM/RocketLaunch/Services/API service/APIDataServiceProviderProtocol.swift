//
//  APIDataServiceProviderProtocol.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation

protocol APIDataServiceProviderProtocol {
    func getRocketList() -> [Rocket]

    func getRocketDetail(id: String) -> RocketDetail?
}
