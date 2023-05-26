import Combine
import Foundation

public extension RocketsClient {
  static let preview = Self(
    getRocket: { _ in RocketDetail.mock },
    getAllRockets: { [RocketDetail.mock] }
  )
}
