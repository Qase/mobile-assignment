import SwiftUI

public struct QuantiButtonStyle: ButtonStyle {
  
  public init() {}

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .padding()
      .background(configuration.isPressed ? Color.quanti.opacity(0.3) : Color.quanti)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: 24))
  }
}
