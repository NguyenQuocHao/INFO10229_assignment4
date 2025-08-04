//
//  MenuView.swift
//  A4HaoNguyen
//
//  Created by user275773 on 8/3/25.
//

import SwiftUI

struct MenuView: View {
//    let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())
    @State private var yesterday: Date = {
        Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }()

    @State var list: [TodoItem] = ([
        TodoItem(title: "Do iOS assignment",
                 priority: Priority.Important,
                 deadline: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                 description: "Test"),
        TodoItem(title: "Study for CArchitecture",
                 priority: Priority.Critical,
                 deadline: Calendar.current.date(byAdding: .hour, value: 10, to: Date())!,
                 description: "Test"),
        TodoItem(title: "Do Math assignment",
                 priority: Priority.Normal,
                 deadline: Calendar.current.date(byAdding: .day, value: 2, to: Date())!,
                 description: "Test"),
        
    ])
    
    var body: some View {
        NavigationStack{
            VStack{
                ForEach(0..<list.count, id:\.self){ localId in
                    NavigationLink(list[localId].title, destination: ItemView(item: list[localId]))
                        .navigationTitle(Text("Menu"))
                }
            }
            
        }
    }
}

#Preview {
    MenuView()
}
