import SwiftUI

class CanvasModel: ObservableObject {
  
  @Published var list = [Thing]()
  
  func eraseAll(){
    list.removeAll()
  }
  
  func eraseCircles() {
    list.removeAll { thing in
      if case Shape.circle(_) = thing.shape { return true }
      return false
    }
  }
  
  func eraseSquares() {
    list.removeAll { thing in
      if case Shape.roundedRect(_) = thing.shape { return true }
      return false
    }
  }
  
  func drawCircle() {
    let aThing = Thing(
      id: UUID().uuidString,
      shape: .circle(Circle()),
      size: CGFloat.random(in: 50...150),
      position: randomPoint()
    )
    
    list.append(aThing)
  }
  
  func drawRectangle() {
    let aThing = Thing(
      id: UUID().uuidString,
      shape: .roundedRect(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))),
      size: CGFloat.random(in: 50...150),
      position: randomPoint()
    )
    
    list.append(aThing)
  }
  
  func bringToFront(_ index: Int) {
    let thing = list[index]
    list.remove(at: index)
    list.append(thing)
  }
  
  func change(thing: inout Thing, color: () -> Color) {
    thing.color = color()
  }
  
  func change(thing: inout Thing, newPosition: CGPoint) {
    thing.position = newPosition
  }
  
  func randomPoint() -> CGPoint {
     let x = CGFloat.random(in: 0...300)
     let y = CGFloat.random(in: 0...300)
     return CGPoint(x: x, y: y)
  }
}
