import SwiftUI

class CanvasModel: ObservableObject {
  
  @Published var list = [Thing]()
  
  func removeAll() {
    list.removeAll()
  }
  
  func add() {
    let aThing = Thing(
      id: UUID().uuidString,
      circle: Circle(),
      size: CGFloat.random(in: 50...150),
      position: randomPoint()
    )
    
    list.append(aThing)
  }
  
  func getNewColor() -> Color {
    return Color(
      red: Double.random(in: 0...1),
      green: Double.random(in: 0...1),
      blue: Double.random(in: 0...1)
    )
  }
  
  func randomPoint() -> CGPoint {
     let x = CGFloat.random(in: 0...300)
     let y = CGFloat.random(in: 0...300)
     return CGPoint(x: x, y: y)
  }
}
