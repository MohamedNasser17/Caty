//
//  BaseDataBaseService.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import RealmSwift

class BaseDatabaseService: BaseDataBaseServiceProtocol {
    
    // MARK: - Properties
    private let realm: Realm?
    
    // MARK: - Init
    init() {
        do {
            realm = try Realm()
        } catch {
            realm = nil
            print("Error in init realm database")
        }
    }
}

// MARK: - BaseDataBaseServiceProtocol Methods
extension BaseDatabaseService {
    func addItemToLocalDataBase<Element: Objectable & Object>(object: Element, completion: (Result<Any, Error>) -> ()) {
        do {
            try realm?.write({
                realm?.add(object, update: .modified)
                completion(.success(()))
            })
        } catch {
            completion(.failure(error))
        }
    }
    
    func removeItemFromLocalDataBase<Element: Objectable & Object>(type: Element.Type,
                                                                   query: String, completion: (Result<Any, Error>) -> ()) {
        do {
            try realm?.write({
                if let objects = realm?.objects(type.self).filter(query) {
                    realm?.delete(objects)
                }
                completion(.success(()))
            })
        } catch {
            completion(.failure(error))
        }
    }
    
    func getItemsFromLocalDataBase<Element: Object, R: Entitable>(type: Element.Type, query: String) -> [R] {
        let objects = realm?.objects(CatPictureEntity.self).filter(query)
        return objects?.map({ $0.toObject as! R }) ?? []
    }
    
    func getItemsFromLocalDataBase<Element: Objectable & Object, R: Entitable>(type: Element.Type) -> [R] {
        let objects = realm?.objects(type)
        return objects?.map({ $0.toObject as! R }) ?? []
    }
}
