import SwiftUI

struct TheThing: Identifiable {
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

struct ContentView: View {
  @State private var thingsOnScreen: [TheThing] = []
  
  var body: some View {
    NavigationStack {
      ZStack {
        ForEach(thingsOnScreen) { index in
          index.circle
            .foregroundColor(index.color)
            .position(index.position)
            .frame(width: index.size, height: index.size)
        }
      }
      .navigationTitle("Circles")
      .toolbar{
        ToolbarItemGroup(placement: .topBarTrailing) {
          Button {
            addCircle()
          } label: {
            Image(systemName: "plus.circle")
          }
        }
      }
    }
  }
  
  func addCircle() {
    let theThing = TheThing(
      id: UUID().uuidString,
      circle: Circle(),
      size: CGFloat.random(in: 50...150),
      position: randomPoint()
    )
    
    thingsOnScreen.append(theThing)
  }
  
  func randomPoint() -> CGPoint {
    let x = CGFloat.random(in: 0...300) // Adjust the range as needed
    let y = CGFloat.random(in: 0...300) // Adjust the range as needed
    return CGPoint(x: x, y: y)
  }
  
}
