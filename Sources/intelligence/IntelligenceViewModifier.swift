import SwiftUI

private let colors: [Color] = [.blue, .purple, .red, .orange, .yellow, .cyan, .blue, .purple]

struct IntelligenceViewModifier<S: Shape>: ViewModifier {
  @State private var offset: CGFloat = 0

  var shape: S
  var spread: CGFloat
  var blur: CGFloat

  func body(content: Content) -> some View {
    content
      .background {
        shape
          .fill(LinearGradient(
            colors: colors,
            startPoint: UnitPoint(x: offset, y: 0),
            endPoint: UnitPoint(x: CGFloat(colors.count) + offset, y: 0))
          )
          .padding(-spread)
          .blur(radius: blur)
          .onAppear {
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
              offset = -CGFloat(colors.count - 1)
            }
          }
      }
  }
}

public extension View {
  func intelligence<S: Shape>(spread: CGFloat = 0, blur: CGFloat = 8, shape: S) -> some View {
    modifier(IntelligenceViewModifier(shape: shape, spread: spread, blur: blur))
  }
}

#Preview {
  VStack(spacing: 32) {
    Circle()
      .frame(width: 100, height: 100)
      .intelligence(spread: 0, blur: 8, shape: Circle())

    Text("Button")
      .fontWeight(.medium)
      .frame(maxWidth: .infinity)
      .padding(.horizontal, 32)
      .padding(.vertical)
      .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 16))
      .foregroundStyle(.secondary)
      .intelligence(spread: 0, blur: 4, shape: RoundedRectangle(cornerRadius: 16))
  }
  .fixedSize(horizontal: true, vertical: false)
}
