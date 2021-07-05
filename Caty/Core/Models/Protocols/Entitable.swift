//
//  Entitable.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import RealmSwift

protocol Entitable {
    associatedtype T: Object
    var toEntity: T { get }
}
