//
//  SetList.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 17.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct SetList: View {
    var setSelections: [SetSelectionFragment]
    var name: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.name).font(.headline).padding([.leading, .top])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center) {
                    ForEach(setSelections, id: \.id) { setSelection in
                        SetButton(setSelection: setSelection, disabled: false)
                    }
                }.padding(.horizontal)
                
            }
        }
    }
}

struct SetButton: View {
    var setSelection: SetSelectionFragment
    var disabled: Bool
    @EnvironmentObject var settings: ModalSettings
    var body: some View {
        Button(action: {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            //self.settings.modalVisible = true
            //self.settings.skill = self.set
        }) {
            HStack {
                VStack {
                    SetImage(setSelection: setSelection)
                }.overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.blue, lineWidth: 2).shadow(radius: 5.0)
                )
                VStack(alignment: .leading) {
                    Text(setSelection.selectedSet?.fragments.setFragment.name ?? "").font(.body).foregroundColor(Color.black)
                    SetTypeText(setType: setSelection.type, weaponType: setSelection.weaponType)
                    Text(setSelection.glyph?.fragments.modificationFragment.type ?? "").font(.caption).foregroundColor(Color.gray)
                    Text(setSelection.trait?.fragments.modificationFragment.type ?? "").font(.footnote).foregroundColor(Color.gray)
                }
                
            }
            
        }
    }
}

struct SetImage: View {
    var setSelection: SetSelectionFragment
    
    
    private func getImageSrc(slot: String, slug: String?) -> String {
        var slugPrefix: String = ""
        var slotSrc: String = ""
        if(slug != nil) {
            if(slug!.contains("perfected")) {
                let splittedSlug = slug!.components(separatedBy: "-perfected-")
                slugPrefix = "\(splittedSlug[0])"
            } else {
                slugPrefix = "\(slug!)"
            }
        }
        switch(slot) {
        case "MAIN_HAND":
            slotSrc = "mainhand.png"
        case "OFF_HAND":
            slotSrc = "offhand.png"
        case "LEGS":
            slotSrc = "legs.png"
        case "HEAD":
            slotSrc = "head.png"
        case "SHOULDERS":
            slotSrc = "shoulders.png"
        case "WAIST":
            slotSrc = "waist.png"
        case "HANDS":
            slotSrc = "hands.png"
        case "FEET":
            slotSrc = "feet.png"
        case "CHEST":
            slotSrc = "chest.png"
        case "RING":
            slotSrc = "ring.png"
        case "RING1":
            slotSrc = "ring.png"
        case "RING2":
            slotSrc = "ring.png"
        case "NECK":
            slotSrc = "neck.png"
        case "DAGGER":
            slotSrc = "dagger.png"
        case "SHIELD":
            slotSrc = "shield.png"
        case "1H_AXE":
            slotSrc = "axe.png"
        case "1H_MACE":
            slotSrc = "hammer.png"
        case "1H_SWORD":
            slotSrc = "sword.png"
        case "2H_AXE":
            slotSrc = "axe.png"
        case "BOW":
            slotSrc = "bow.png"
        case "FIRE_STAFF":
            slotSrc = "staff.png"
        case "ICE_STAFF":
            slotSrc = "staff.png"
        case "LIGHTNING_STAFF":
            slotSrc = "staff.png"
        case "2H_MACE":
            slotSrc = "hammer.png"
        case "RESTORATION_STAFF":
            slotSrc = "staff.png"
        case "2H_SWORD":
            slotSrc = "sword.png"
        default:
            slotSrc = ""
        }
        if(slugPrefix != "") {
            Logger.log(.error, "\(slugPrefix)_\(slotSrc)")
            return "\(slugPrefix)_\(slotSrc)"
        } else {
            return slotSrc
        }
    }
    
    private func getSetForSelection(_ setSelection: SetSelectionFragment) -> SetFragment? {
        return setSelection.selectedSet?.fragments.setFragment
    }
    
    @State private var imageType: ImageTypes = .heavyArmor
    @State private var imageName: String?
    @State private var slug: String?
    
    
    var body: some View {
        HStack {
            RemoteImage(name: getImageSrc(slot: imageName ?? "", slug: slug), type: imageType, width: 60, height: 60)
        }.onAppear {
            if(self.setSelection.type == "" || self.setSelection.type == nil) {
                self.imageName = self.setSelection.slot
                self.imageType = .jewelry
            } else if(self.getSetForSelection(self.setSelection)?.type == "Monster Set") {
                self.slug = self.getSetForSelection(self.setSelection)?.slug
                self.imageName = self.setSelection.slot
                self.imageType = .monster
            } else if(self.getSetForSelection(self.setSelection)?.bonusItem_1 == nil && self.getSetForSelection(self.setSelection)?.bonusItem_2 != nil && self.getSetForSelection(self.setSelection)?.bonusItem_3 == nil ) {
                self.imageType = .weaponSets
                self.imageName = self.setSelection.weaponType
                self.slug = self.getSetForSelection(self.setSelection)?.slug
                Logger.log(.debug, "\(self.slug), \(self.imageType), \(self.imageName)")
            }
            else if(self.setSelection.type == "ONE_HANDED") {
                self.imageName = self.setSelection.weaponType
                self.imageType = .onehanded
            } else if(self.setSelection.type == "TWO_HANDED") {
                self.imageName = self.setSelection.weaponType
                self.imageType = .twohanded
            } else if(self.setSelection.type == "LIGHT_ARMOR") {
                self.imageName = self.setSelection.slot
                self.imageType = .lightArmor
            } else if(self.setSelection.type == "MEDIUM_ARMOR") {
                self.imageName = self.setSelection.slot
                self.imageType = .mediumArmor
            } else if(self.setSelection.type == "HEAVY_ARMOR") {
                self.imageName = self.setSelection.slot
                self.imageType = .heavyArmor
            } else {
                self.imageName = self.setSelection.slot
                self.imageType = .heavyArmor
            }
        }
    }
}

struct SetTypeText: View {
    var setType: String?
    var weaponType: String?
    @State private var text: String = ""
    @State private var color: Color = Color.black
    var body: some View {
        HStack {
            Text(text).font(.body).foregroundColor(color)
        }.onAppear {
            if(self.setType == "LIGHT_ARMOR") {
                self.text = "Light Armor"
                self.color = .blue
            }
            else if(self.setType == "MEDIUM_ARMOR") {
                self.text = "Medium Armor"
                self.color = .green
            } else if(self.setType == "HEAVY_ARMOR") {
                self.text = "Heavy Armor"
                self.color = .red
            } else if(self.setType == "ONE_HANDED") {
                var weaponText = ""
                switch(self.weaponType) {
                case "DAGGER":
                    weaponText = "Dagger"
                case "1H_AXE":
                    weaponText = "Axe (1h)"
                case "1H_MACE":
                    weaponText = "Mace (1h)"
                case "1H_SWORD":
                    weaponText = "Sword (1h)"
                default:
                    weaponText = "Weapon"
                }
                self.text = weaponText
                self.color = .orange
            } else if(self.setType == "TWO_HANDED") {
                var weaponText = ""
                switch(self.weaponType) {
                case "2H_AXE":
                    weaponText = "Axe (2h)"
                case "2H_MACE":
                    weaponText = "Mace (2h)"
                case "2H_SWORD":
                    weaponText = "Sword (2h)"
                case "BOW":
                    weaponText = "Bow"
                case "RESTORATION_STAFF":
                    weaponText = "Restoration Staff"
                case "LIGHTNING_STAFF":
                    weaponText = "Lightning Staff"
                case "FIRE_STAFF":
                    weaponText = "Fire Staff"
                case "FROST_STAFF":
                    weaponText = "Frost Staff"
                default:
                    weaponText = "Weapon"
                }
                self.text = weaponText
                self.color = .orange
                
            } else {
                self.text = "Jewelry"
                self.color = .yellow
            }
        }
    }
}

struct SetList_Previews: PreviewProvider {
    static var previews: some View {
        SetList(setSelections: [], name: "Big Pieces")
    }
}
