import SwiftUI

class CanvasModel: ObservableObject {
  
  @Published var list = [Thing]()
  private var backupList = [Thing]()
  
  func undo() {
    list = backupList
  }
  
  func eraseAllShapes(){
    backupList = list
    list.removeAll()
  }
  
  func eraseShapesOfType(_ shape: Shape) {
    backupList = list
    list.removeAll { thing in
      thing.shape == shape
    }
  }
  
  func drawShape(_ shape: Shape) {
    backupList = list
    let aThing = Thing(
      id: UUID().uuidString,
      shape: shape,
      size: CGFloat.random(in: 50...150),
      position: randomPoint()
    )
    
    list.append(aThing)
  }
  
  func bringToFront(_ index: Int) {
    backupList = list
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
    let x = CGFloat.random(in: 0...UIScreen.main.bounds.width)
    let y = CGFloat.random(in: 0...UIScreen.main.bounds.height)
     return CGPoint(x: x, y: y)
  }
}
