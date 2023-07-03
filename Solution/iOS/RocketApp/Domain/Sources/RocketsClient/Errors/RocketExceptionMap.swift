import Foundation
import fetchRockets

func errorFromRocketFailure(_ failure: RocketResult<RocketException>) -> Error {
    switch failure {
    case is RocketResult<RocketException.HttpError>:
        return RocketsClientAsyncError.networkError(.serverError(statusCode: 404))
    case is RocketResult<RocketException.NetworkError>:
        return RocketsClientAsyncError.networkError(.noConnection)
    case is RocketResult<RocketException.UnknownError>:
        return RocketsClientAsyncError.undefinedError
    default:
        return RocketsClientAsyncError.networkError(.timeoutError)
    }
}
