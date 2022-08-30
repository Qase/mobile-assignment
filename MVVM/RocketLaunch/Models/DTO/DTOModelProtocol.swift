//
//  DTOModelProtocol.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 29.08.2022.
//

import Foundation

// MARK: - DTO Model Protocol

protocol DTOModelProtocol {
    associatedtype T

    var toModel: T { get }
}
