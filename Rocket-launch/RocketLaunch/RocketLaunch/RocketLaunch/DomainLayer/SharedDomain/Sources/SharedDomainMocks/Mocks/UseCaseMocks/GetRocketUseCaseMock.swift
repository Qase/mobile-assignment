//
//  GetRocketUseCaseMock.swift
//  
//
//  Created by Tomáš Brand on 01.04.2023.
//

import SharedDomain

public final class GetRocketUseCaseMock: GetRocketUseCase {
    
    public init() {}
    
    //MARK: - execute
    
    public var executeCallsCount = 0
    public var executeCalled: Bool {
        return executeCallsCount > 0
    }
    public var executeReturnValue: Rocket!
    public init(executeReturnValue: Rocket) {
        self.executeReturnValue = executeReturnValue
    }
    public var executeClosure: (() -> Rocket)?
    
    public func execute(id: String) async throws -> Rocket {
        executeCallsCount += 1
        if let executeClosure = executeClosure {
            return executeClosure()
        } else {
            return executeReturnValue
        }
    }
}
