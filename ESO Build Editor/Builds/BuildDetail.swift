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
            HStack(alignment: .center) {
                ForEach(self.build.newBarOne ?? [], id: \.id) { skillSelection in
                    SkillButton(skill: skillSelection.skill?.fragments.skillFragment)
                }
                SkillButton(skill: self.build.ultimateOne?.fragments.skillFragment)
            }
            
            HStack(alignment: .center) {
                ForEach(self.build.newBarTwo ?? [], id: \.id) { skillSelection in
                    SkillButton(skill: skillSelection.skill?.fragments.skillFragment)
                }
                SkillButton(skill: self.build.ultimateTwo?.fragments.skillFragment)
            }
            
            Divider()
            
        }.navigationBarTitle("\(build.name ?? "")")
        
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


struct BuildDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BuildDetail(buildId: "String").environmentObject(ModalSettings())
            Build(build: defaultBuild)
        }
        
    }
}

struct SkillButton: View {
    var skill: SkillFragment?
    @EnvironmentObject var settings: ModalSettings
    var body: some View {
        Button(action: {
            self.settings.modalVisible = true
            self.settings.skill = self.skill
        }) {
            RemoteImage(name: skill?.icon ?? "", type: .skill)
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
            RemoteImage(name: imageName ?? "", type: imageType)
            VStack(alignment: .leading) {
                Text(text ?? "").font(.headline)
                Text(description ?? "").font(.caption).foregroundColor(Color.gray)
            }.padding(.leading, 10)
        }.padding()
    }
}
