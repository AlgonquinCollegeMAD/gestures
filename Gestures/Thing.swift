import SwiftUI

enum Shape {
    case circle(Circle)
    case roundedRect(RoundedRectangle)
}

struct Thing: Identifiable, Equatable {
  static func == (lhs: Thing, rhs: Thing) -> Bool {
    lhs.id == rhs.id
  }
  
  var id: String
  var shape: Shape
  var size: CGFloat
  var position: CGPoint
  var color = Color(
    red: Double.random(in: 0...1),
    green: Double.random(in: 0...1),
    blue: Double.random(in: 0...1)
  )
}
