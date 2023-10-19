import SwiftUI

struct Canvas: View {
  @ObservedObject var model = CanvasModel()
  @State private var isPresentingConfirmDelete = false
  
  var body: some View {
    NavigationStack {
      ZStack {
        ForEach(model.list.indices, id: \.self) { index in
          ThingView(thing: $model.list[index])
            .gesture(
              TapGesture(count: 2).onEnded({ _ in
                model.bringToFront(index)
              })
            )
            .gesture(
              TapGesture(count: 1).onEnded({ _ in
                model.change(thing: &model.list[index]) {
                  Color(
                    red: Double.random(in: 0...1),
                    green: Double.random(in: 0...1),
                    blue: Double.random(in: 0...1)
                  )
                }
              })
            )
            .gesture(
              DragGesture().onChanged({ value in
                model.change(thing: &model.list[index], newPosition: value.location)
              })
            )
            .confirmationDialog("Are you sure you want erase things?", isPresented: $isPresentingConfirmDelete) {
              VStack {
                Button("Erase all squares", role: .destructive) {
                  model.eraseSquares()
                }
                Button("Erase all circles", role: .destructive) {
                  model.eraseCircles()
                }
                Button("Erase all shapes", role: .destructive) {
                  model.eraseAll()
                }
              }
            }
        }
      }
      .navigationTitle("Shapes")
      .toolbar{
        
        ToolbarItemGroup(placement: .topBarLeading) {
          Button {
            model.drawCircle()
          } label: {
            Image(systemName: "plus.circle")
          }
          
          Button {
            model.drawRectangle()
          } label: {
            Image(systemName: "plus.square")
          }
        }
        
        ToolbarItemGroup(placement: .topBarTrailing) {
          Button {
            isPresentingConfirmDelete = true
          } label: {
            Image(systemName: "eraser")
          }
        }
      }
    }
  }
}
