//
//  FavouriteCatPicture.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

struct FavouriteCatPicture: Codable {
    var id: String
    var picture: CatPicture
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case picture = "image"
    }
     
    init() {
        self.id = ""
        self.picture = CatPicture()
    }
    
    init(id: String, picture: CatPicture?) {
        self.id = id
        self.picture = picture ?? CatPicture()
    }
}
