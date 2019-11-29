//
//  BuildDetail.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 14.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

let defaultBuild: BuildQuery.Data.Build = BuildQuery.Data.Build(id: "id", name: "Test Build", applicationArea: "Cyrodiil: Raid", description: "My Description", role: "Healer", race: "Orc", esoClass: "Templar", published: true, accessRights: "private")

func getDescription(forResource resource: String, title: String) -> String {
    if let path = Bundle.main.url(forResource: resource, withExtension: "json") {
        do {
            let data = try Data(contentsOf: path)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let result = json as? Array<Dictionary<String, String>> {
                for container in result {
                    if container["title"] == title {
                        return container["description"] ?? ""
                    }
                }
              }
          } catch {
            Logger.log(.error, "ERROR")
               // handle error
          }
    }
    return ""
}

struct Build: View {
    var build: BuildQuery.Data.Build
    var interactable: Bool = true
    @EnvironmentObject var settings: ModalSettings
    
    var body: some View {
        let frontBar = self.build.newBarOne?.map { $0.skill!.fragments.skillFragment
            } ?? []
        let backBar = self.build.newBarTwo?.map { $0.skill!.fragments.skillFragment
            } ?? []
        let bigPieces = self.build.bigPieceSelection?.map {
            $0.fragments.setSelectionFragment
            } ?? []
        let smallPieces = self.build.smallPieceSelection?.map {
            $0.fragments.setSelectionFragment
            } ?? []
        let jewelryPieces = self.build.jewelrySelection?.map {
            $0.fragments.setSelectionFragment
            } ?? []
        var frontbarPieces = self.build.frontbarSelection?.map {
            $0.fragments.setSelectionFragment
            } ?? []
        if(frontbarPieces[0].type == "TWO_HANDED") {
            frontbarPieces.removeLast()
        }
        var backbarPieces = self.build.backbarSelection?.map {
            $0.fragments.setSelectionFragment
            } ?? []
        if(backbarPieces[0].type == "TWO_HANDED") {
            backbarPieces.removeLast()
        }
        let raceDescription = getDescription(forResource: "races", title: self.build.race ?? "")
        
        let classDescription = getDescription(forResource: "classes", title: self.build.esoClass ?? "")


        return ScrollView {
            VStack(alignment: .leading) {
                IconDescription(imageName: self.build.race, imageType: .race, text: self.build.race, description: raceDescription)
                Divider()
                IconDescription(imageName: self.build.esoClass, imageType: .esoClass, text: self.build.esoClass, description: classDescription)
                Divider()
                IconDescription(imageName: self.build.mundusStone?.icon, imageType: .mundusStone, text: self.build.mundusStone?.name, description: "\(self.build.mundusStone?.effect ?? "") by \(self.build.mundusStone?.value ?? "")")
                Divider()
                IconDescription(imageName: self.build.buff?.icon, imageType: .buff, text: self.build.buff?.name, description: self.build.buff?.buffDescription)
                Divider()
            }
            
            SkillBar(skills: frontBar, ultimate:  self.build.ultimateOne?.fragments.skillFragment ?? defaultSkill, barName: "Ability Bar 1", interactable: interactable)
            SkillBar(skills: backBar, ultimate:  self.build.ultimateTwo?.fragments.skillFragment ?? defaultSkill, barName: "Ability Bar 2", interactable: interactable)
            
            Group {
                Divider()
                SetList(setSelections: bigPieces, name: "Big Pieces")
                Divider()
                SetList(setSelections: smallPieces, name: "Small Pieces")
                Divider()
                SetList(setSelections: jewelryPieces, name: "Jewelry Pieces")
                Divider()
                SetList(setSelections: frontbarPieces, name: "Frontbar Pieces")
                Divider()
                SetList(setSelections: backbarPieces, name: "Backbar Pieces")
            }
            
        }.navigationBarTitle("\(build.name ?? "")")
    }
}

struct BuildDetail: View {
    var buildId:String
    var interactable:Bool?
    
    @State private var build: BuildQuery.Data.Build?
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
                Build(build: build!, interactable: interactable ?? true)
            } else {
                Spacer()
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                Text("Loading...")
                Spacer()
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
