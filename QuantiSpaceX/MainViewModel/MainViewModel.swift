//
//  MainViewModel.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var rocketModel = RocketModel()
    
    var apiClient: APIClientProtocol
    
    init( apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        self.downloadRocketsData()
    }
    
    func downloadRocketsData(completion: (()->())? = nil) {
        apiClient.getAllRockets() { allRockets, error in
            self.rocketModel.rocketList = allRockets
            
        }
    }
    
}
