//
//  MenuView.swift
//  A4HaoNguyen
//
//  Created by user275773 on 8/3/25.
//

import SwiftUI
import Foundation

struct MenuView: View {
    @State private var isLight = true
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
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium // Date only
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    var body: some View {        Toggle("Light Mode", isOn: $isLight)
        //                        .tint(.regText)
        NavigationStack{
            //            Toggle("Light Mode", isOn: $isLight)
            //                        .tint(.regText)
            List{
                
                ForEach(0..<list.count, id:\.self){ localId in
                    NavigationLink(destination: ItemView(item: list[localId])) {
                        Image(ViewUtils.getIcon(priority: list[localId].priority))
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("\(list[localId].title)\nDeadline: \(formatDate(date: list[localId].deadline))")
                    }
                }
                
            }
            .navigationTitle(Text("Todo List"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .foregroundStyle(.regText)
        .background(.colorBg)
        .preferredColorScheme(isLight ? .light : .dark)
        
    }
}

#Preview {
    MenuView()
}
