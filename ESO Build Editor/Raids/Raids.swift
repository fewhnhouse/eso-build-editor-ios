//
//  Raids.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 16.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI


struct Raids: View {
    @State var raids:[RaidsQuery.Data.Raid] = []
    func fetch() {
        Apollo.shared.apollo.fetch(query: RaidsQuery()) { result in

            guard let data = try? result.get().data else {
                print("no data")
                return
            }

            self.raids = data.raids ?? []
        }
        
    }
    
    var body: some View {
        List(raids, id: \.id) { raid in
            NavigationLink(destination: RaidDetail(raidId: raid.id) ) {
                RaidRow(name: raid.name ?? "", description: raid.description ?? "")
            }
        }.onAppear {
            self.fetch()
        }

    }
}

struct Raids_Previews: PreviewProvider {
    static var previews: some View {
        Raids()
    }
}
