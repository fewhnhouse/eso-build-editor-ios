//
//  SearchBar.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 19.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct ContainerView: View {
    @Binding var text: String
    @Binding var isActiveField: Bool
    var body: some View {
        ZStack {
            VStack {
                Text("background")
            }
            /*HStack {
                Image(systemName: "magnifyingglass")
                TextField($text, placeholder: Text("Search photos"), onEditingChanged: { isActive in
                    self.isActiveField = isActive
                })
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "multiply.circle")
                    }
                }
            }*/
        }
    }
}

struct SearchBarView: View {
    @State var text: String = ""
    @State var isActiveBar: Bool = false
    var body: some View {
        HStack(alignment: VerticalAlignment.center, spacing: 0, content: {
            ContainerView(text: $text, isActiveField: $isActiveBar)
 
            Button(action: {
                self.isActiveBar = false
                self.text = ""
            }) {
                Text("Cancel")
            }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: isActiveBar ? 16 : -52))
        }).animation(.default)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
