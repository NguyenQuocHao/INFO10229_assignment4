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
    
    private func getIcon(priority: Priority) -> String {
        switch priority {
        case .Critical:
            return "bolt"
        case .Important:
            return "exclamationmark"
        default:
            return "sun.max"
        }
    }
    
    var body: some View {
        Toggle("Light Mode", isOn: $isLight)
        //                        .tint(.regText)
        NavigationStack{
            //            Toggle("Light Mode", isOn: $isLight)
            //                        .tint(.regText)
            List{
                
                ForEach(0..<list.count, id:\.self){ localId in
                    NavigationLink(destination: ItemView(item: list[localId])) {
                        Image(systemName: getIcon(priority: list[localId].priority)) // SF Symbol image
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                        
                        Text("\(list[localId].title)\nDeadline: \(formatDate(date: list[localId].deadline))")
                    }
                    
                    
                }
                
            }
            .navigationTitle(Text("Todo List"))
            VStack{
                
            }
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
