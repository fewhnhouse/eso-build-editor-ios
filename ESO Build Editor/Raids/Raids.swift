//
//  Raids.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 16.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI
import PartialSheet

enum ModalType {
    case small
    case medium
    case full
}

struct Overlay: View {
    var modalType: ModalType
    
    var body: some View {
        VStack {
            Text("Overlay \(modalType == .small ? "Small" : modalType == .medium ? "Medium" : "Big")")
            HStack {
                Spacer()
            }.cornerRadius(10.0)
        }.frame(width: 500, height: modalType == .small ? 300 : modalType == .medium ? 600 : 800).background(Color.blue).cornerRadius(20.0).offset(x: 0, y: 400)
    }
}
struct Raids: View {
    @State private var modalPresented: Bool = false
    @State private var longer: Bool = false
    @State private var modalType: ModalType = .small
    @State var drag: CGSize = CGSize.zero
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                }.cornerRadius(10.0)
                Spacer()
                Text("Background")
            }.background(Color.red).cornerRadius(20.0).edgesIgnoringSafeArea(.all)
                .offset(x: 0, y: 0)
            Overlay(modalType: modalType).gesture(DragGesture().onChanged { value in
                self.drag = value.translation
                Logger.log(.debug, value.translation.height )
                if(value.translation.height < -100 && self.modalType == .small) {
                    self.modalType = .medium
                }else if(value.translation.height < -100 && self.modalType == .medium) {
                    self.modalType = .full
                } else if(value.translation.height > 100 && self.modalType == .full) {
                    self.modalType = .medium
                }
                else if(value.translation.height > 100 && self.modalType == .medium) {
                    self.modalType = .small
                }
                
            }.onEnded { value in
                self.drag = CGSize.zero
            }).animation(.spring()).offset(x: 0, y: drag.height)
        }
    }
}

struct Raids_Previews: PreviewProvider {
    static var previews: some View {
        Raids()
    }
}
