//
//  Builds.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 13.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI



struct Builds: View {
    @State var builds:[BuildsQuery.Data.Build] = []
    func fetch() {
        Apollo.shared.apollo.fetch(query: BuildsQuery()) { result in

            guard let data = try? result.get().data else {
                print("no data")
                return
            }

            self.builds = data.builds ?? []
        }
        
    }
    
    
    var body: some View {
        List(builds, id: \.id) { build in
            NavigationLink(destination: BuildDetail(buildId: build.id)) {
                BuildRow(buildName: build.name ?? "", buildDesc: build.description ?? "")
            }
        }.onAppear {
            self.fetch()
        }
        .navigationBarTitle("Builds")
    }
}

struct Builds_Previews: PreviewProvider {
    static var previews: some View {
        Builds()
    }
}
