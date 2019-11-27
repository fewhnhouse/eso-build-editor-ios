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
                Raid(raid: raid ?? defaultRaid)
            } else {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                Text("Loading...")
            }
        }.onAppear {
            self.fetch()
        }
    }
}

struct Raid: View {
    let raid: RaidQuery.Data.Raid
    let selectedViewStyles = ["list.bullet", "square.grid.2x2"]
    @State private var selectedViewStyle = 0
    @State private var showSheet = false
    var body: some View {
        VStack {
            Picker(selection: $selectedViewStyle, label: Text("View Style")) {
                ForEach(0 ..< selectedViewStyles.count) { index in
                    Image(systemName: self.selectedViewStyles[index])
                }
            }.pickerStyle(SegmentedPickerStyle())
            List {
                ForEach(raid.roles ?? [], id: \.id) { role in
                    Section(header: Text(role.name ?? "")) {
                        ForEach(role.builds ?? [], id: \.id) { build in
                            Button(action: {
                                self.showSheet = true
                            }) {
                                HStack {
                                    RemoteImage(name: build.build.fragments.buildFragment.race ?? "race", type: .race, width: 30, height: 30)
                                    RemoteImage(name: build.build.fragments.buildFragment.esoClass ?? "name", type: .esoClass, width: 30, height: 30)
                                    VStack(alignment: .leading) {
                                        Text(build.build.fragments.buildFragment.name ?? "Build Name").font(.headline)                .foregroundColor(Color.black)

                                        HStack {
                                            Text(build.build.fragments.buildFragment.race ?? "").font(.caption).foregroundColor(Color.gray)
                                            Divider()
                                            Text(build.build.fragments.buildFragment.esoClass ?? "").font(.caption).foregroundColor(Color.gray)

                                        }
                                        
                                    }
                                }
                            }.sheet(isPresented: self.$showSheet) {
                                VStack {
                                    RoundedRectangle(cornerRadius: 4.0).fill(Color.gray).frame(width: 30, height: 5).padding()
                                    Text(build.build.fragments.buildFragment.name ?? "Build Name").font(.headline)
                                    Divider()
                                    Spacer()
                                    BuildDetail(buildId: build.build.fragments.buildFragment.id, interactable: false )
                                }
                            }
                        }
                    }
                }
            }.listStyle(GroupedListStyle())
        }.navigationBarTitle(raid.name ?? "Raid")
    }
}

struct RaidDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RaidDetail(raidId: "")
            Raid(raid: defaultRaid)
        }
    }
}
