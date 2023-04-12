//
//  NetworkTask.swift
//  
//
//  Created by Tomáš Brand on 11.03.2023.
//

import Foundation

public enum NetworkTask {
    /// A request with no additional data.
    case requestPlain

    /// A requests body set with encoded parameters.
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}
