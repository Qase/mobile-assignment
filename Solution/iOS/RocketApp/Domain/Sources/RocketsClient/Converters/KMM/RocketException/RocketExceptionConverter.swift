import Foundation
import ModelConvertible
import fetchRockets

public typealias RocketExceptionConverter = ModelConverter<RocketsClientAsyncError, RocketResult<RocketException>>
