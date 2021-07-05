//
//  Objectable.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

protocol Objectable {
    associatedtype T
    var toObject: T { get }
}
