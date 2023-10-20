import SwiftUI

struct ThingView: View {
  
  @Binding var thing: Thing
  
  var body: some View {
    switch thing.shape {
    case .circle(let circle):
      circle
        .foregroundColor(thing.color)
        .frame(width: thing.size, height: thing.size)
        .position(thing.position)
    case .roundedRect(let roundedRectangle):
      roundedRectangle
        .foregroundColor(thing.color)
        .frame(width: thing.size, height: thing.size)
        .position(thing.position)
    case .liquid(let liquid):
      liquid
        .foregroundColor(thing.color)
        .frame(width: thing.size, height: thing.size)
        .position(thing.position)
    }
  }
}
