//
//  NetworkMonitor.swift
//  QuantiSpaceX
//
//  Created by Petr Žáček on 27.12.2024.
//

import Foundation
import Network
import SwiftUI

enum NetworkStatus {
    case online
    case offline
}

class NetworkMonitor: ObservableObject {
    
    // Singleton access
    static let shared = NetworkMonitor()
    
    private let monitor: NWPathMonitor
    private var callbacks: [Int: (Bool) -> ()] = [:]
    @Published private(set) var wasOnline = false
    @Published private(set) var currentStatus: NetworkStatus = .offline
    
    private init() {
        monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We are online")
                self.wasOnline = true
                self.currentStatus = .online
                self.performWaitingCallbacks()
            } else {
                print("We are offline")
                self.currentStatus = .offline
            }
        }
        monitor.start(queue: DispatchQueue.main)
    }
    
    private func performWaitingCallbacks() {
        callbacks.keys.forEach { id in
            self.callbacks[id]?(true)
            self.callbacks.removeValue(forKey: id)
        }
    }
    
    func performWhenNetworkIsAvailable(
        _ block: @escaping (Bool) -> (),
        timeout: TimeInterval = 30.0
    ) {
        if self.currentStatus == .online {
            block(true)
        } else {
            let randomId = Int.random(in: Int.min..<Int.max)
            callbacks[randomId] = block
            DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
                self.callbacks[randomId]?(false)
                self.callbacks.removeValue(forKey: randomId)
            }
        }
    }
    
}
