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
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        NavigationView {
            TabView {
                Builds()
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("Builds")
                }.navigationBarTitle("Builds")
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
        }.partialSheet(presented: $settings.modalVisible, backgroundColor: colorScheme == .light ? Color.white : Color.black) {
                
                SkillOverlay()
                

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
