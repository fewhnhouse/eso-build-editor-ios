//
//  Login.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 13.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var settings: ModalSettings

    func handleClick() {
        self.settings.modalVisible = true

        /*Apollo.shared.apollo.perform(mutation: LoginMutation(email: "cyro@fist.com", password: "cyrofist")) { result in
          guard let data = try? result.get().data else { return }
          print(data.login?.token)
            print(data.login?.user?.name)
        }*/
    }
    var body: some View {
        VStack {
            Button(action: handleClick) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }

        }

    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(ModalSettings())
    }
}
