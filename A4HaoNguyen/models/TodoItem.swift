//
//  TodoItem.swift
//  A4HaoNguyen
//
//  Created by user275773 on 8/3/25.
//
import SwiftUI

enum Priority {
    case Critical
    case Important
    case Normal
}

struct TodoItem: Identifiable {
    var id = 0
    var title = ""
    var priority = Priority.Normal
    var deadline = Date()
    var description = ""
    
    var isLate: Bool {
        let components = Calendar.current.dateComponents([.day, .hour], from: deadline, to: Date())
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        
        return day >= 0 && hour >= 0
    }
    
    var deadlineStr: String {
        let formatter = DateFormatter()

        formatter.dateStyle = .long
        formatter.timeStyle = .short
        
        return formatter.string(from: deadline)
    }
    
    var lateByMessage: String {
        let components = Calendar.current.dateComponents([.day, .hour], from: deadline, to: Date())
        let day = components.day ?? 0
        
        let hour = components.hour ?? 0
        
        // Past due date
        if (day >= 0 && hour >= 0) {
            let remainingTimeMessage = "Already late by: "
            let dayStr = "\(abs(day)) day\(abs(day) > 1 ? "s" : "") "
            let hourStr = "\(abs(hour)) hour\(abs(hour) > 1 ? "s" : "")"
            
            return remainingTimeMessage + (day != 0 ? dayStr : "") + (hour != 0 ? hourStr : "")
        }
        
        // Not due yet
        let remainingTimeMessage = "Remaining time: "
        let dayStr = "\(abs(day)) day\(abs(day) > 1 ? "s" : "") "
        let hourStr = "\(abs(hour)) hour\(abs(hour) > 1 ? "s" : "")"
        
        return remainingTimeMessage + (day != 0 ? dayStr : "") + (hour != 0 ? hourStr : "")
    }
}

