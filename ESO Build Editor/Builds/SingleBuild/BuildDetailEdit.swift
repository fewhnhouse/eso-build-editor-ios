//
//  BuildDetailEdit.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 29.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct BuildDetailEdit: View {
    var build: BuildQuery.Data.Build
    var strengths = ["Mild", "Medium", "Mature"]
    @State private var selectedStrength = 0
    
    var body: some View {
        
        Form {
            Section {
                Picker(selection: $selectedStrength, label: Text("Race")) {
                    ForEach(0 ..< strengths.count) {
                        Text(self.strengths[$0])
                        
                    }
                }
                Picker(selection: $selectedStrength, label: Text("Class")) {
                    ForEach(0 ..< strengths.count) {
                        Text(self.strengths[$0])
                        
                    }
                }
                Picker(selection: $selectedStrength, label: Text("Mundus Stone")) {
                    ForEach(0 ..< strengths.count) {
                        Text(self.strengths[$0])
                        
                    }
                }
                Picker(selection: $selectedStrength, label: Text("Buff Food")) {
                    ForEach(0 ..< strengths.count) {
                        Text(self.strengths[$0])
                        
                    }
                }
            }
        }
    }
}

struct BuildDetailEdit_Previews: PreviewProvider {
    static var previews: some View {
        BuildDetailEdit(build: defaultBuild)
    }
}
