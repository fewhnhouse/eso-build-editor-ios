//
//  SwiftUIView.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 16.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI
import Combine

enum ModalItemType {
    case skill
    case armor
}
class ModalSettings: ObservableObject {
    @Published var modalVisible = false
    @Published var modalType = ModalItemType.skill
    @Published var skill: SkillFragment?
    @Published var modalExtended = false
}
