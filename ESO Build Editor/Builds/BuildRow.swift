//
//  BuildRow.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 13.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct BuildRow: View {
    var buildName: String?
    var buildDesc: String?
    var race: String?
    var esoClass: String?
    var body: some View {
        HStack(alignment: .center) {
            RemoteImage(name: race ?? "", type: .race, width: 40, height: 40)
            RemoteImage(name: esoClass ?? "", type: .esoClass, width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(buildName ?? "name").font(.headline)
                Text(buildDesc ?? "description").font(.footnote).foregroundColor(Color.gray)
            }.padding()
            Spacer()
        }
    }
}

struct BuildRow_Previews: PreviewProvider {
    static var previews: some View {
        BuildRow(buildName: "Build Name", buildDesc: "Build Description", race: "Orc", esoClass: "Templar")
    }
}
