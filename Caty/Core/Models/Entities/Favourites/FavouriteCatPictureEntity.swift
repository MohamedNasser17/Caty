//
//  FavouriteCatPictureEntity.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import RealmSwift

class FavouriteCatPictureEntity: Object {
    @objc dynamic var id: String
    @objc dynamic var picture: CatPictureEntity?
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    override init() {
        self.id = ""
        self.picture = CatPictureEntity()
    }
    
    init(id: String, picture: CatPictureEntity) {
        self.id = id
        self.picture = picture
    }
}

extension FavouriteCatPictureEntity: Objectable {
    var toObject: FavouriteCatPicture {
        return FavouriteCatPicture(id: self.id, picture: self.picture?.toObject)
    }
}

extension FavouriteCatPicture: Entitable {
    var toEntity: FavouriteCatPictureEntity {
        return FavouriteCatPictureEntity(id: self.id, picture: self.picture.toEntity)
    }
}
