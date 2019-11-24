//
//  RaidDetail.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 24.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

let defaultRaid: RaidQuery.Data.Raid = RaidQuery.Data.Raid(id: "id", name: "Test Raid", description: "My Description", applicationArea: "Cyrodiil: Raid", published: true, accessRights: "private" )

struct RaidDetail: View {
    let raidId: String
    @State var raid: RaidQuery.Data.Raid?
    func fetch() {
        Apollo.shared.apollo.fetch(query: RaidQuery(id: raidId)) { result in
            
            guard let data = try? result.get().data else {
                print("no data")
                return
            }
            
            self.raid = data.raid ?? defaultRaid
        }
        
    }
    var body: some View {
        VStack {
            if((raid) != nil) {
                Text(raid?.name ?? "")
            } else {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                Text("Loading...")
            }
        }.onAppear {
            self.fetch()
        }
    }
}

struct RaidDetail_Previews: PreviewProvider {
    static var previews: some View {
        RaidDetail(raidId: "")
    }
}
