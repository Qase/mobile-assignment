//
//  APIClient.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 26.12.2024.
//

import Foundation
import Alamofire

class APIClient: APIClientProtocol {
    
    let decoder = JSONDecoder()
    // MARK: - Properties
    private let rootUrl: String = "https://api.spacexdata.com/v4"
    
    enum ApiPath {
        case getRockets
        var path: String {
            get {
                switch (self) {
                case .getRockets: return "/rockets"
                }
            }
        }
    }
    
    
    // MARK: - Functions
    func getAllRockets(completion: @escaping ([RocketList]?, Error?) -> Void) {
        AF.request(
            rootUrl + ApiPath.getRockets.path,
            method: .get,
            parameters: nil
        )
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(_):
//                  Debug API
//                guard let responseData = response.data else { return }
//                print("JSON String: \(String(data: responseData, encoding: .utf8))")
                guard let data = response.data,
                      let rocketList = try? self.decoder.decode([RocketList].self, from: data) else {
                    print("error")
                    completion(
                        nil,
                        QuantiSpaceXError.unknown
                    )
                    return
                }
//                for rocket in rocketList {
//                    print("Rocket Name: \(rocket.name)")
//                }
                completion(rocketList, nil)
                
            case .failure(let error):
                    completion(nil, error)
                return
                
            }
        }
    }
}
