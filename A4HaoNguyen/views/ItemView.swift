//  Code by Hao Nguyen, 991521091

import SwiftUI
import Foundation

struct ItemView: View {
    var item: TodoItem
    let currentDate = Date() // Get the current date and time
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack{
                Image(ViewUtils.getIconName(priority: item.priority))
                    .resizable()
                    .frame(width: 100, height: 120)
                Text(item.title)
                    .padding(.bottom, 7)
                Text(item.deadlineStr)
                    .bold()
                    .padding(.bottom, 25)
            }
            .frame(maxWidth: .infinity) // make the 1st text block's width inifinity so the text can be aligned to center
            
            VStack(alignment: .leading) { // align the 2nd text block to left
                Text("Priority: \(item.priority)")
                Text("Description: \(item.description)")
                Text(item.lateByMessage)
                    .bold(item.isLate)
                    .foregroundStyle(item.isLate ? .customRed : .bgOpposite)
                    .frame(alignment: .leading) // align text to left
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 100)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
        )
        .foregroundStyle(.bgOpposite)
        .background(.bg)
    }
}

//#Preview {
//    ItemView(item: TodoItem)
//}
