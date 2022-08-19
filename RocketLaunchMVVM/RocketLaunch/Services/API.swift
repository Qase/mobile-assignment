//
//  API.swift
//  rocketLaunch
//
//  Created by Lucie Havrdová on 25.01.2022.
//

import Foundation
import Combine
import UIKit

struct API {
    let urlAllRockets: URL
    let urlSpecificRocket: URL? = nil
    var urlAllRocketsComponents = URLComponents()
    
    init(){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spacexdata.com"
        components.path = "/v4/rockets/5e9d0d95eda69974db09d1ed"
        
        self.urlAllRockets = components.url!
        
        allRocketUrlComponentInit()
    }
    
    private mutating func allRocketUrlComponentInit() {
        urlAllRocketsComponents.scheme = "https"
        urlAllRocketsComponents.host = "api.spacexdata.com"
        urlAllRocketsComponents.path = "/v4/rockets/"
        /*
        urlAllRocketsComponents.queryItems = [
            URLQueryItem(name: "payloads", value: "")
        ]
         */
    }
    
    
    func getAllRockets() -> [Rocket]? { //jina url než urlAllRockets
        var rockets: [Rocket]? = nil
        
        guard let urlAllRockets = urlAllRocketsComponents.url else {
            return nil //TODO THROW something
        }
        
        let task = URLSession.shared.dataTask(with: urlAllRockets) {(data, response, error) in
            guard let data = data else { return }
            
            //guard let jsonData = String(data: data, encoding: .utf8)?.data(using: .utf8) else { return }
            
            do {
                let decoder = JSONDecoder()
                rockets = try decoder.decode([Rocket].self, from: data)
                
                for rocket in rockets ?? [] {
                    print(rocket.name)
                }
            } catch {
                print("ERROR OCCURED - \(error)")
                
            }
        }
        task.resume()
        
        if rockets == nil {
            print("you have no raketky")
        }
        
        return rockets
    }
}



















enum APIError: Error {
    case invalidURL
}

class APIProvider {
    private let logQueue = DispatchQueue(label: "rocketLaunch.api-log", qos: .background)
    
    private lazy var session: URLSession = {
        return URLSession.shared
    }()
    
    func request(
        endPoint: Endpoint
    ){
        if let url = endPoint.url {
            let task = session.dataTask(with: url) {(data, response, error) in
                guard let data = data else {return}
                
                do {
                    let decoder = JSONDecoder()
                    let rocket: Rocket = try decoder.decode(Rocket.self, from: data)
                    print("--\(rocket.name)--")
                } catch {
                    print("ERROR: \(error)")
                }
            }
            task.resume()
        }
    }
    
    private func createRequest(
        endPoint: Endpoint
    ) throws -> URLRequest {
        guard let urlComponent = endPoint.urlComponent else {
            throw APIError.invalidURL
        }
        
        guard let url = urlComponent.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        
        let debugString = """
        DEBUG: - ApiProvider: create request to \(String(describing: urlComponent.url)),
        method \(endPoint.method),
        filter: \(String(describing: urlComponent.queryItems))
        """
        log(message: debugString)
        
        return request
    }
    
    private func log(message: String) {
        logQueue.async {
            print(message)
        }
    }
}
