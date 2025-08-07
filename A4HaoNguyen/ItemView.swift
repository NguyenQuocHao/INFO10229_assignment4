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
        VStack{
            Text(item.title)
            Text(item.deadline, style: .date)
            Text(item.deadline, style: .time)
            Text("Priority: \(item.priority)")
            Text("Description: \(item.description)")
//            if (item.lateByDay >= 0 && item.lateByHour >= 0) {
//                let remainingTimeMessage = "Already late by: \(item.lateByDay) day(s) and: \(item.lateByHour) hour(s)"
//                Text(remainingTimeMessage)
//            }
//            else{
//                let remainingTimeMessage = "Remaining time: "
//                let day = "\(abs(item.lateByDay)) day\(abs(item.lateByDay) > 1 ? "s" : "") "
//                let hour = "\(abs(item.lateByHour)) hour\(abs(item.lateByHour) > 1 ? "s" : "")"
//                Text(remainingTimeMessage + (item.lateByDay > 0 ? day : "") + hour)
//            }
            Text(item.lateByMessage)
        }
    }
}

//#Preview {
//    ItemView(item: String)
//}
