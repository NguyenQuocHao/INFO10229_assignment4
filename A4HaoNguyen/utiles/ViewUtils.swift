//
//  ViewUtils.swift
//  A4HaoNguyen
//
//  Created by user275773 on 8/8/25.
//

public struct ViewUtils {
    static func getIcon(priority: Priority) -> String {
        switch priority {
        case .Critical:
            return "critical"
        case .Important:
            return "important"
        default:
            return "regular"
        }
    }
}

