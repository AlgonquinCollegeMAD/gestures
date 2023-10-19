import SwiftUI

enum Shape: Equatable {
  static func == (lhs: Shape, rhs: Shape) -> Bool {
    switch (lhs, rhs) {
    case (.circle(_), .circle(_)):
      return true
    case (.roundedRect(_), .roundedRect(_)):
      return true
    default:
      return false
    }
  }
  case circle(Circle = Circle())
  case roundedRect(RoundedRectangle = RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
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
