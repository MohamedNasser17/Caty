//
//  BaseDataBaseServiceProtocol.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import RealmSwift

protocol BaseDataBaseServiceProtocol {
    func addItemToLocalDataBase<Element: Objectable & Object>(object: Element, completion: (Result<Any, Error>) -> ())
    func removeItemFromLocalDataBase<Element: Objectable & Object>(type: Element.Type,
                                                                   query: String, completion: (Result<Any, Error>) -> ())
    
    func getItemsFromLocalDataBase<Element: Objectable & Object, R: Entitable>(type: Element.Type) -> [R]
    func getItemsFromLocalDataBase<Element: Objectable & Object, R: Entitable>(type: Element.Type, query: String) -> [R]
}

extension BaseDataBaseServiceProtocol {
    func addItemToLocalDataBase<Element: Objectable & Object>(object: Element, completion: (Result<Any, Error>) -> ()) {
        let service = BaseDatabaseService()
        service.addItemToLocalDataBase(object: object, completion: completion)
    }
    
    func removeItemFromLocalDataBase<Element: Objectable & Object>(type: Element.Type,
                                                                   query: String, completion: (Result<Any, Error>) -> ()) {
        let service = BaseDatabaseService()
        service.removeItemFromLocalDataBase(type: type, query: query, completion: completion)
    }
    
    func getItemsFromLocalDataBase<Element: Objectable & Object, R: Entitable>(type: Element.Type, query: String) -> [R] {
        let service = BaseDatabaseService()
        return service.getItemsFromLocalDataBase(type: type, query: query)
    }
    
    func getItemsFromLocalDataBase<Element: Objectable & Object, R: Entitable>(type: Element.Type) -> [R] {
        let service = BaseDatabaseService()
        return service.getItemsFromLocalDataBase(type: type)
    }
}
