//
//  BuildDetail.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 14.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

let defaultBuild: BuildQuery.Data.Build = BuildQuery.Data.Build(id: "id", name: "Test Build", applicationArea: "Cyrodiil: Raid", description: "My Description", role: "Healer", race: "Orc", esoClass: "Templar", published: true, accessRights: "private")


struct Build: View {
    var build: BuildQuery.Data.Build
    @EnvironmentObject var settings: ModalSettings
    @State private var frontBar: [SkillFragment] = []
    @State private var backBar: [SkillFragment] = []
    @State private var bigPieces: [SetSelectionFragment] = []

    var body: some View {
        ScrollView {
            
            
            
            VStack(alignment: .leading) {
                IconDescription(imageName: self.build.race, imageType: .race, text: self.build.race, description: "desc")
                Divider()
                IconDescription(imageName: self.build.esoClass, imageType: .esoClass, text: self.build.esoClass, description: "desc")
                Divider()
                IconDescription(imageName: self.build.mundusStone?.icon, imageType: .mundusStone, text: self.build.mundusStone?.name, description: "\(self.build.mundusStone?.effect ?? "") by \(self.build.mundusStone?.value ?? "")")
                Divider()
                IconDescription(imageName: self.build.buff?.icon, imageType: .buff, text: self.build.buff?.name, description: self.build.buff?.buffDescription)
                Divider()
            }

            SkillBar(skills: self.frontBar, ultimate:  self.build.ultimateOne?.fragments.skillFragment ?? defaultSkill, barName: "Ability Bar 1")
            SkillBar(skills: self.backBar, ultimate:  self.build.ultimateTwo?.fragments.skillFragment ?? defaultSkill, barName: "Ability Bar 2")
            
            Divider()
            SetList(setSelections: self.bigPieces)

        }.navigationBarTitle("\(build.name ?? "")").onAppear {
            self.frontBar = self.build.newBarOne?.map { $0.skill!.fragments.skillFragment
            } ?? []
            self.backBar = self.build.newBarTwo?.map { $0.skill!.fragments.skillFragment
            } ?? []
            self.bigPieces = self.build.bigPieceSelection?.map {
                $0.fragments.setSelectionFragment
            } ?? []

            Logger.log(.warning, self.bigPieces)
        }
        
    }
}

struct BuildDetail: View {
    var buildId:String
    
    
    @State var build: BuildQuery.Data.Build?
    func fetch() {
        Apollo.shared.apollo.fetch(query: BuildQuery(id: buildId)) { result in
            
            guard let data = try? result.get().data else {
                print("no data")
                return
            }
            
            self.build = data.build ?? defaultBuild
        }
        
    }
    var body: some View {
        
        VStack {
            if((build) != nil) {
                Build(build: build!)
            } else {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                Text("Loading...")
            }
        }.onAppear {
            self.fetch()
        }
        
    }
}




struct IconDescription: View {
    var imageName: String?
    var imageType: ImageTypes
    var text: String?
    var description: String?
    var body: some View {
        HStack {
            RemoteImage(name: imageName ?? "", type: imageType, width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(text ?? "").font(.headline)
                Text(description ?? "").font(.footnote).foregroundColor(Color.gray)
            }.padding(.leading, 10)
        }.padding()
    }
}


struct BuildDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BuildDetail(buildId: "String").environmentObject(ModalSettings())
            Build(build: defaultBuild)
        }
        
    }
}