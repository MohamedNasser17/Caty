//
//  CatPicture.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

struct CatPicture: Codable {
    let id: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
    }
     
    init() {
        self.id = ""
        self.url = ""
    }
    
    init(id: String, url: String) {
        self.id = id
        self.url = url
    }
}
