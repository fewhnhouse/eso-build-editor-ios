//
//  ImageService.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 14.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

