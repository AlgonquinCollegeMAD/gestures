import SwiftUI
import Liquid

struct LiquidShape: View {
  var body: some View {
    ZStack {
      Liquid(samples: 5, period: 1.0)
        .opacity(0.3)
    }
  }
}

#Preview {
  LiquidShape()
}
