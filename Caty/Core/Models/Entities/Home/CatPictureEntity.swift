//
//  CatPictureEntity.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import RealmSwift

class CatPictureEntity: Object {
    @objc dynamic var id: String
    @objc dynamic var url: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    override init() {
        self.id = ""
        self.url = ""
    }
    
    init(id: String, url: String) {
        self.id = id
        self.url = url
    }
    
    init(_ object: CatPicture) {
        self.id = object.id
        self.url = object.url
    }
}


extension CatPictureEntity: Objectable {
    var toObject: CatPicture {
        return CatPicture(id: self.id, url: self.url)
    }
}

extension CatPicture: Entitable {
    var toEntity: CatPictureEntity {
        return CatPictureEntity(id: self.id, url: self.url)
    }
}
