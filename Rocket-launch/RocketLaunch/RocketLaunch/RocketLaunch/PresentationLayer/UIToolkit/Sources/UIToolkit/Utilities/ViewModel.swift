//
//  ViewModel.swift
//  
//
//  Created by Tomáš Brand on 12.03.2023.
//

@MainActor
public protocol ViewModel {
    // Lifecycle
    func onAppear()
    func onDisappear()
    
    // State
    associatedtype State
    var state: State { get }
    
    // Intent
    associatedtype Intent
    func onIntent(_ intent: Intent)
}
