//
//  UserDefaultsProvider.swift
//  
//
//  Created by Tomáš Brand on 10.04.2023.
//

public enum UserDefaultsCoding: String, CaseIterable {
    case hasRunBefore
}

public protocol UserDefaultsProvider {
    
    /// Try to read a value for the given key
    func read<T>(_ key: UserDefaultsCoding) throws -> T

    /// Create or update the given key with a given value
    func update<T>(_ key: UserDefaultsCoding, value: T) throws

    /// Delete value for the given key
    func delete(_ key: UserDefaultsCoding) throws

    /// Delete all records
    func deleteAll() throws
}
