//
//  RaidRow.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 24.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct RaidRow: View {
    let name: String
    let description: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(name).font(.headline)
            Text(description).font(.footnote).foregroundColor(Color.gray)
        }.padding()
    }
}

struct RaidRow_Previews: PreviewProvider {
    static var previews: some View {
        RaidRow(name: "test", description: "test")
    }
}
