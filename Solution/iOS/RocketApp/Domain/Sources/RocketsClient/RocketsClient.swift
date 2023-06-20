import Combine
import Foundation
import KMMmodule

public struct RocketsClient {
  public typealias GetRocketFunction = (String) async throws -> RocketDetail
  public typealias GetAllRocketsFunction = () async throws -> [RocketDetail]

  public var getRocket: GetRocketFunction
  public var getAllRockets: GetAllRocketsFunction
}
