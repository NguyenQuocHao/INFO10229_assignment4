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
        Spacer()
        VStack(alignment: .leading){
            Image(ViewUtils.getIcon(priority: item.priority))
                .resizable()
                .frame(width: 100, height: 120)
            
            Text(item.title)
            Text(item.deadlineStr)
                .bold()
        }
        Spacer()
        
        VStack {
            Text("Priority: \(item.priority)")
            Text("Description: \(item.description)")
            Text(item.lateByMessage)
                .bold(item.isLate)
                .foregroundStyle(item.isLate ? .red : .primary)
            //            .multilineTextAlignment(.leading)
        }
//        .padding(.all, 0)
        Spacer()
    }
}

//#Preview {
//    ItemView(item: String)
//}
