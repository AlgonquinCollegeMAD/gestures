import SwiftUI

class CanvasModel: ObservableObject {
  
  @Published var list = [Thing]()
  
  func removeAll(){
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
