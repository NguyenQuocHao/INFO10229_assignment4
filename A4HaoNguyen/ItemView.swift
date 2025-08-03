//
//  temView.swift
//  A4HaoNguyen
//
//  Created by user275773 on 8/3/25.
//

import SwiftUI

struct ItemView: View {
    @Binding var item: String

    var body: some View {
        VStack{
            Text(item)
        }
    }
}

//#Preview {
//    ItemView(item: String)
//}
