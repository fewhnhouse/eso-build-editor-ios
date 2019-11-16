//
//  ContentView.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 12.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var modalPresented: Bool = false
    @State private var longer: Bool = false
    @EnvironmentObject var settings: ModalSettings
    
    var body: some View {
        NavigationView {
            TabView {
                Builds()
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("Builds")
                }
                Raids()
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Raids")
                }
                Login()
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Groups")
                }
                Me()
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Profile")
                }
            }
            .font(.headline)
        }.partialSheet(presented: $settings.modalVisible) {
                
                SkillOverlay()
                

        }.gesture(DragGesture().onChanged { value in
            Logger.log(.debug, "gesture")
            if(value.translation.height < -100) {
                self.settings.modalExtended = true
            } else if(value.translation.height > 100) {
                self.settings.modalExtended = false
            }
        }.onEnded { value in
            
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
