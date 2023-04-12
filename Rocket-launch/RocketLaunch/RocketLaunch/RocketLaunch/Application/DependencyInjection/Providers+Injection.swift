//
//  Providers+Injection.swift
//  Rocket Launch
//
//  Created by Tomáš Brand on 11.03.2023.
//

import NetworkProvider
import UserDefaultsProvider
import Resolver
import SharedDomain
import UIKit

public extension Resolver {
    static func registerProviders(networkProviderDelegate: NetworkProviderDelegate) {
        register { SystemNetworkProvider(delegate: networkProviderDelegate) as NetworkProvider }
        register { SystemUserDefaultsProvider() as UserDefaultsProvider }
    }
} 

