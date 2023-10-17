import SwiftUI

struct Thing: Identifiable, Equatable {
  static func == (lhs: Thing, rhs: Thing) -> Bool {
    lhs.id == rhs.id
  }
  
  var id: String
  var circle: Circle
  var size: CGFloat
  var position: CGPoint
  var color = Color(
    red: Double.random(in: 0...1),
    green: Double.random(in: 0...1),
    blue: Double.random(in: 0...1)
  )
}
