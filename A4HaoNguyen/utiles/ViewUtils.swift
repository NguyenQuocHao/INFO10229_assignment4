//  Code by Hao Nguyen, 991521091

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
}

