import SwiftUI

struct ThingView: View {
  
  @Binding var thing: Thing
  
  var body: some View {
    thing.circle
      .foregroundColor(thing.color)
      .frame(width: thing.size, height: thing.size)
      .position(thing.position)
  }
}
