//  Code by Hao Nguyen, 991521091

import SwiftUI
import Foundation

struct MenuView: View {
    @State private var isLight = true
    
    // Get another date based on today, as shown in this Stackoverflow discussion: https://stackoverflow.com/questions/44009804/swift-3-how-to-get-date-for-tomorrow-and-yesterday-take-care-special-case-ne
    @State private var yesterday: Date = {
        Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }()
    
    @State var todoList: [TodoItem] = ([
        TodoItem(id: 1,
                 title: "Do iOS assignment",
                 priority: Priority.Important,
                 deadline: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                 description: "I have to finish this by tonight, or else... I don't know"),
        TodoItem(id: 2,
                 title: "Study for Computer Architecture",
                 priority: Priority.Critical,
                 deadline: Calendar.current.date(byAdding: .hour, value: 10, to: Date())!,
                 description: "Test"),
        TodoItem(id: 3,
                 title: "Do Math assignment",
                 priority: Priority.Normal,
                 deadline: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
                 description: "MATH!!"),
        
    ])
    
    var body: some View {
        NavigationStack{
            VStack {
                Toggle("Light Mode", isOn: $isLight)
                    .tint(.bgOpposite)
                List{
                    ForEach(0..<todoList.count, id:\.self){ localId in
                        NavigationLink(destination: ItemView(item: todoList[localId])) {
                            Image(ViewUtils.getIconName(priority: todoList[localId].priority))
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("\(todoList[localId].title)\nDeadline: \(ViewUtils.formatDate(date: todoList[localId].deadline))")
                                .foregroundStyle(todoList[localId].isLate ? .customRed : .bgOpposite)
                                .bold(todoList[localId].isLate)
                        }
                        .listRowBackground(isLight ? Color(.systemBackground) : .listRow) // Sets background for each row
                    }
                }
                .scrollContentBackground(!isLight ? .hidden : .automatic)
            }
            .navigationTitle(Text("Todo List"))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.bgOpposite)
            .background(.bg)
            .preferredColorScheme(isLight ? .light : .dark)
        }
    }
}

#Preview {
    MenuView()
}
