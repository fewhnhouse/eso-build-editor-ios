//
//  RemoteImage.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 14.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import SwiftUI

enum ImageTypes: String {
    case buff = "buffs"
    case race = "races"
    case esoClass = "classes"
    case skill = "skills"
    case mundusStone = "mundusStones"
    case armor = "armor"
    case weapon = "weapons"
}

struct RemoteImage: View {
    let IMAGE_SERVICE_URL="https://eso-build-image-service.fewhnhouse.de"
    

    
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(name:String, type: ImageTypes ) {
        Logger.log(.debug, type)
        imageLoader = ImageLoader(urlString:"\(IMAGE_SERVICE_URL)/\(type.rawValue)/\(name.contains(".png") ? name : "\(name).png")")
    }

    var body: some View {
        VStack {
            Image(uiImage: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40, height:40)
                .cornerRadius(4.0)
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }

    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(name: "orc", type: .race)
    }
}
