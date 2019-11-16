//
//  Form.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 13.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct MyForm: View {
    @State private var visible = true
    @State private var name = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextPicker()
                    Toggle(isOn: $visible) {
                        Text("Toggle")
                    }
                    TextField("Type a name...", text: $name)
                    Text("Name: \(name)")
                }
                Section {
                    ForEach(0 ..< 100) {
                        Text("Row\($0)")
                    }
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("test")
                        Text("test2")
                    }
                }
            }
            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
        
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        MyForm()
    }
}
