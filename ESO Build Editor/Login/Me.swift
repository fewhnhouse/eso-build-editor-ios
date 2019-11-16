//
//  Me.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 13.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct Me: View {
    var test = Apollo.shared.apollo.fetch(query: MeQuery()) { result in
        guard let data = try? result.get().data else {
            print("no data")
            return
        }
        print(data.me?.name ?? "none")
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Me_Previews: PreviewProvider {
    static var previews: some View {
        Me()
    }
}
