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
    @State private var frontBar: [SkillFragment] = []
    @State private var backBar: [SkillFragment] = []
    @State private var bigPieces: [SetSelectionFragment] = []
    @State private var smallPieces: [SetSelectionFragment] = []
    @State private var jewelryPieces: [SetSelectionFragment] = []
    @State private var frontbarPieces: [SetSelectionFragment] = []
    @State private var backbarPieces: [SetSelectionFragment] = []
    @State private var raceDescription: String = ""
    @State private var classDescription: String = ""
    var body: some View {
        ScrollView {
            
            
            
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
            
            SkillBar(skills: self.frontBar, ultimate:  self.build.ultimateOne?.fragments.skillFragment ?? defaultSkill, barName: "Ability Bar 1", interactable: interactable)
            SkillBar(skills: self.backBar, ultimate:  self.build.ultimateTwo?.fragments.skillFragment ?? defaultSkill, barName: "Ability Bar 2", interactable: interactable)
            
            Group {
                Divider()
                SetList(setSelections: self.bigPieces, name: "Big Pieces")
                Divider()
                SetList(setSelections: self.smallPieces, name: "Small Pieces")
                Divider()
                SetList(setSelections: self.jewelryPieces, name: "Jewelry Pieces")
                Divider()
                SetList(setSelections: self.frontbarPieces, name: "Frontbar Pieces")
                Divider()
                SetList(setSelections: self.backbarPieces, name: "Backbar Pieces")
            }
            
        }.navigationBarTitle("\(build.name ?? "")").onAppear {
            self.frontBar = self.build.newBarOne?.map { $0.skill!.fragments.skillFragment
                } ?? []
            self.backBar = self.build.newBarTwo?.map { $0.skill!.fragments.skillFragment
                } ?? []
            self.bigPieces = self.build.bigPieceSelection?.map {
                $0.fragments.setSelectionFragment
                } ?? []
            self.smallPieces = self.build.smallPieceSelection?.map {
                $0.fragments.setSelectionFragment
                } ?? []
            self.jewelryPieces = self.build.jewelrySelection?.map {
                $0.fragments.setSelectionFragment
                } ?? []
            self.frontbarPieces = self.build.frontbarSelection?.map {
                $0.fragments.setSelectionFragment
                } ?? []
            if(self.frontbarPieces[0].type == "TWO_HANDED") {
                self.frontbarPieces.removeLast()
            }
            self.backbarPieces = self.build.backbarSelection?.map {
                $0.fragments.setSelectionFragment
                } ?? []
            if(self.backbarPieces[0].type == "TWO_HANDED") {
                self.backbarPieces.removeLast()
            }
            self.raceDescription = getDescription(forResource: "races", title: self.build.race ?? "")
            self.classDescription = getDescription(forResource: "classes", title: self.build.esoClass ?? "")

        }
        
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
