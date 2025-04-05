//
//  APIClientProtocol.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import Foundation

protocol APIClientProtocol {
    
    func getAllRockets(completion: @escaping ([RocketList]?, Error?) -> ())
    
}
