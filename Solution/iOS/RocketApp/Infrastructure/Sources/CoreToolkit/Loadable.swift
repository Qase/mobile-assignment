import Foundation

public enum Loadable<Data: Equatable, Error: Equatable>: Equatable {
  case notRequested
  case loading
  case success(Data)
  case failure(Error)

  public var isLoading: Bool {
    switch self {
    case .loading:
      return true
    default:
      return false
    }
  }

  public var loadingSucceeded: Bool {
    switch self {
    case .success:
      return true
    default:
      return false
    }
  }

  public var data: Data? {
    switch self {
    case let .success(data):
      return data
    default:
      return nil
    }
  }

  public var error: Error? {
    switch self {
    case let .failure(error):
      return error
    default:
      return nil
    }
  }
}
