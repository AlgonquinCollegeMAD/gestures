import SwiftUI

struct Canvas: View {
  @ObservedObject var model = CanvasModel()
  @State private var isPresentingConfirmDeleteCircles = false
  @State private var isPresentingConfirmDeleteRectangles = false
  
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
            .confirmationDialog("Are you sure you want to remove all circles?", isPresented: $isPresentingConfirmDeleteCircles) {
              Button("Remove all circles", role: .destructive) {
                model.removeCircles()
              }
            }
            .confirmationDialog("Are you sure wyopu want to remove all squares?", isPresented: $isPresentingConfirmDeleteRectangles) {
              Button("Remove all squares", role: .destructive) {
                model.removeSquares()
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
            isPresentingConfirmDeleteCircles = true
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
            isPresentingConfirmDeleteRectangles = true
          } label: {
            Image(systemName: "minus.square")
          }
        }
      }
    }
  }
}
