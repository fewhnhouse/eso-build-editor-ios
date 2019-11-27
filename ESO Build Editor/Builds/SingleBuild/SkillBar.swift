//
//  SkillBar.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 17.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct SkillBar: View {
    var skills: [SkillFragment]
    let ultimate: SkillFragment
    let barName: String
    let interactable: Bool
    @State private var btnDisabled = false
    var body: some View {
        VStack(alignment: .leading) {
            Text(barName).font(.headline).padding([.leading, .top])
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(skills, id: \.id) { skillFragment in
                    SkillButton(skill: skillFragment, disabled: !self.interactable || self.btnDisabled)
                }
                SkillButton(skill: ultimate, disabled: btnDisabled)
            }.padding(.horizontal)
        }.gesture(DragGesture().onChanged { value in
            self.btnDisabled = true
            Logger.log(.debug, "changed")
        }.onEnded { value in
            self.btnDisabled = false
            Logger.log(.debug, "ended")

        })
        }
        
    }
}

struct SkillButton: View {
    var skill: SkillFragment?
    var disabled: Bool
    @EnvironmentObject var settings: ModalSettings
    var body: some View {
        Button(action: {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            self.settings.modalVisible = true
            self.settings.skill = self.skill
        }) {
            VStack {
                RemoteImage(name: skill?.icon ?? "", type: .skill, width: 60, height: 60)
            }.overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.blue, lineWidth: 2).shadow(radius: 5.0)
            )
            }.padding(2).disabled(disabled)
    }
}

struct SkillBar_Previews: PreviewProvider {
    static var previews: some View {
        SkillBar(skills: [], ultimate: defaultSkill, barName: "Bar", interactable: true)
    }
}

