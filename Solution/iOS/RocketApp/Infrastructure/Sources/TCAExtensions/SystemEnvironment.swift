import Foundation

@dynamicMemberLookup
public struct SystemEnvironment<Environment> {
  var environment: Environment

  subscript<Dependency>(
    dynamicMember keyPath: WritableKeyPath<Environment, Dependency>
  ) -> Dependency {
    get { self.environment[keyPath: keyPath] }
    set { self.environment[keyPath: keyPath] = newValue }
  }

  public static func live(environment: Environment) -> Self {
    Self(environment: environment)
  }

  public static func debug(environment: Environment) -> Self {
    Self(environment: environment)
  }
}
