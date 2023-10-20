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
                  model.eraseShapesOfType(.roundedRect())
                }
                Button("Erase all circles", role: .destructive) {
                  model.eraseShapesOfType(.circle())
                }
                Button("Erase all liquids", role: .destructive) {
                  model.eraseShapesOfType(.liquid())
                }
                Button("Erase all shapes", role: .destructive) {
                  model.eraseAllShapes()
                }
              }
            }
        }
      }
      .navigationTitle("Shapes")
      .toolbar{
        
        ToolbarItemGroup(placement: .topBarLeading) {
          Button {
            model.drawShape(.circle())
          } label: {
            Image(systemName: "plus.circle.fill")
              .foregroundColor(.green)
          }
          
          Button {
            model.drawShape(.roundedRect())
          } label: {
            Image(systemName: "plus.square.fill")
              .foregroundColor(.green)
          }
          
          Button {
            model.drawShape(.liquid())
          } label: {
            Image(systemName: "plus.diamond.fill")
              .foregroundColor(.green)
          }
          
        }
        
        ToolbarItemGroup(placement: .topBarTrailing) {
          Button {
            model.undo()
          } label: {
            Image(systemName: "arrow.uturn.backward.circle.fill").foregroundColor(.black)
          }
          Button {
            if model.list.count > 0 {
              isPresentingConfirmDelete = true
            }
          } label: {
            Image(systemName: "eraser.fill").foregroundColor(.red)
          }
          .symbolEffect(.bounce.up.byLayer, value: isPresentingConfirmDelete)
        }
      }
    }
  }
}
