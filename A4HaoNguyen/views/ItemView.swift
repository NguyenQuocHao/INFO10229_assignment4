//
//  temView.swift
//  A4HaoNguyen
//
//  Created by user275773 on 8/3/25.
//

import SwiftUI
import Foundation

struct ItemView: View {
    var item: TodoItem
    let currentDate = Date() // Get the current date and time
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                Image(ViewUtils.getIcon(priority: item.priority))
                    .resizable()
                    .frame(width: 100, height: 120)
                Text(item.title)
                    .padding(.bottom, 7)
                Text(item.deadlineStr)
                    .bold()
                    .padding(.bottom, 25)
            }
            .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading) {
                Text("Priority: \(item.priority)")
                Text("Description: \(item.description)")
                Text(item.lateByMessage)
                    .bold(item.isLate)
                    .foregroundStyle(item.isLate ? .red : .primary)
                    .frame(alignment: .leading)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 100)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
        )
        .background(.bg)
    }
}

//#Preview {
//    ItemView(item: TodoItem)
//}
