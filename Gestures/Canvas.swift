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
            .confirmationDialog("Are you sure?", isPresented: $isPresentingConfirmDelete) {
              Button("Delete all items", role: .destructive) {
                model.removeAll()
              }
            }
        }
      }
      .navigationTitle("Circles")
      .toolbar{
        
        ToolbarItemGroup(placement: .topBarTrailing) {
          Button {
            model.addCircle()
          } label: {
            Image(systemName: "plus.circle")
          }
          
          Button {
            isPresentingConfirmDelete = true
          } label: {
            Image(systemName: "minus.circle")
          }
        }
        
        ToolbarItemGroup(placement: .topBarLeading) {
          Button {
            model.addRectangle()
          } label: {
            Image(systemName: "plus.square")
          }
          
          Button {
            isPresentingConfirmDelete = true
          } label: {
            Image(systemName: "minus.square")
          }
        }
        
      }
    }
  }
}
