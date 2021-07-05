//
//  CatPictureUIModel.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

struct CatPictureUIModel {
    
    // MARK: - Properties
    var id: String
    var url: String
    var isFavourite: Bool
    
    // MARK: - Init
    init(id: String, url: String, isFavourite: Bool) {
        self.id = id
        self.url = url
        self.isFavourite = isFavourite
    }
    
    init() {
        self.id = ""
        self.url = ""
        self.isFavourite = false
    }
}
