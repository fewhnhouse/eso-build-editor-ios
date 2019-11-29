//
//  BuildDetail.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 14.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI




struct BuildDetail: View {
    var buildId:String
    var interactable:Bool?
    @Environment(\.presentationMode) var presentationMode
    @State private var build: BuildQuery.Data.Build?
    @State private var isEdit = false
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
                if(!isEdit) {
                    
                    BuildDetailDisplay(build: build!, interactable: interactable ?? true)
                } else {
                    BuildDetailEdit(build: build!)
                }
            } else {
                Spacer()
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                Text("Loading...")
                Spacer()
            }
        }.onAppear {
            self.fetch()
        }.navigationBarItems(leading:
            Button(action: {
                if !self.isEdit {
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.isEdit = !self.isEdit
                }
            }) {
                if !self.isEdit {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Builds")
                    }
                } else {
                    Text("Cancel").foregroundColor(Color.gray)
                }
            }, trailing:
            Button(self.isEdit ? "Done" : "Edit") {
                self.isEdit = !self.isEdit
            }
        ).navigationBarTitle("\(self.build?.name ?? "")")
            .navigationBarBackButtonHidden(self.isEdit)
        
    }
}







struct BuildDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BuildDetail(buildId: "String").environmentObject(ModalSettings())
        }
        
    }
}
