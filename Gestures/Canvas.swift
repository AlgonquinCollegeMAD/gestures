import SwiftUI

struct Canvas: View {
  @ObservedObject var model = CanvasModel()
  
  var body: some View {
    NavigationStack {
      ZStack {
        ForEach(model.list.indices, id: \.self) { index in
          ThingView(thing: $model.list[index])
            .onTapGesture(count: 2) {
              model.list[index].color = model.getNewColor()
            }
            .gesture(
              DragGesture().onChanged({ value in
                model.list[index].position = value.location
              })
            )
        }
      }
      .navigationTitle("Circles")
      .toolbar{
        ToolbarItemGroup(placement: .topBarTrailing) {
          Button {
            model.add()
          } label: {
            Image(systemName: "plus.circle")
          }
        }
      }
    }
  }
}

#Preview {
  Canvas()
}
