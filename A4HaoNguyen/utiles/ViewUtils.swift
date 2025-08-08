//  Code by Hao Nguyen, 991521091
import SwiftUI

public struct ViewUtils {
    static func getIconName(priority: Priority) -> String {
        switch priority {
        case .Critical:
            return "critical"
        case .Important:
            return "important"
        default:
            return "regular"
        }
    }
    
    // Convert Date to String, as shown in https://cocoacasts.com/swift-fundamentals-how-to-convert-a-date-to-a-string-in-swift
    static func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium // Date only
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

