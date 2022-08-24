//
//  APIDataServiceProviderProtocol.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import Foundation

protocol APIDataServiceProviderProtocol {
    func getRocketList() async throws -> [Rocket]

    func getRocketDetail(id: String) async throws -> RocketDetail
}
