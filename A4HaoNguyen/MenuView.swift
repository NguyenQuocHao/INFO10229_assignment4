//
//  MenuView.swift
//  A4HaoNguyen
//
//  Created by user275773 on 8/3/25.
//

import SwiftUI

struct MenuView: View {
    @State var list: [String] = ["a", "b"]
    @State private var test = "yo"
    
    var body: some View {
        NavigationStack{
            VStack{
                ForEach(list, id:\.self){ id in
                    NavigationLink(id, destination: ItemView(item: self.$list[0]))
                        .navigationTitle(Text("Menu"))
                }
            }
            
        }
    }
}

#Preview {
    MenuView()
}
