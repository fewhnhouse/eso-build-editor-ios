//
//  SkillOverlay.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 16.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI




let defaultSkill = SkillFragment(id: "id", skillId: 12, castTime: "Instant", cost: "3000 Stamina", effect_1: "No Effect", effect_2: "No Effect 2", icon: "ability_001", name: "Warhorn", parent: 1, range: "10 meters", skillline: 2, slug: "slug", target: "Target", type: 1, unlocksAt: 2)

struct SkillOverlay: View {
    @EnvironmentObject var settings: ModalSettings
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                RemoteImage(name: settings.skill?.icon ?? "", type: .skill, width: 40, height: 40)
                VStack(alignment: .leading) {
                    Text(settings.skill?.name ?? "" ).font(.headline)
                    HStack {
                        Text(settings.skill?.cost ?? "" ).font(.footnote).foregroundColor(Color.purple)
                        Divider().frame(height: 20)
                        Text(settings.skill?.target ?? "Target").font(.footnote)
                        
                    }
                }
            }
            Divider()
            Text(settings.skill?.effect_1 ?? "" ).font(.body)
            Divider()
            Text(settings.skill?.effect_2 ?? "Description").font(.body).foregroundColor(Color.green)
            
        }.padding()
    }
}

struct SkillOverlay_Previews: PreviewProvider {
    static var previews: some View {
        SkillOverlay()
    }
}
