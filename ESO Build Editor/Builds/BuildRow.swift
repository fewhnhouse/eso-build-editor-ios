//
//  BuildRow.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 13.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct BuildRow: View {
    var buildName: String
    var buildDesc: String
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person").resizable()
                .frame(width: 40.0, height: 40.0).padding()
            VStack(alignment: .leading) {
                Text(buildName).autocapitalization(.allCharacters).font(.headline)
                Text(buildDesc).font(.footnote)
            }.padding()
            Spacer()
        }
    }
}

struct BuildRow_Previews: PreviewProvider {
    static var previews: some View {
        BuildRow(buildName: "Build Name", buildDesc: "Build Description")
    }
}
