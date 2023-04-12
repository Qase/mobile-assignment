//
//  UserDefaultsProviderError.swift
//  
//
//  Created by Tomáš Brand on 10.04.2023.
//

public enum UserDefaultsProviderError: Error {
    case invalidBundleIdentifier
    case valueForKeyNotFound
}
