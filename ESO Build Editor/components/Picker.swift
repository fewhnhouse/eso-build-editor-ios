//
//  Picker.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 13.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct TextPicker: View {
    let students = ["Harry", "Ron", "Hermione", "Malfoy"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        VStack {
            
        Picker("Select a student", selection: $selectedStudent) {
            ForEach(0..<students.count) {
                Text("\(self.students[$0])")
            }
        }
            Text("Selected Student: \(selectedStudent)")
        }
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        TextPicker()
    }
}
