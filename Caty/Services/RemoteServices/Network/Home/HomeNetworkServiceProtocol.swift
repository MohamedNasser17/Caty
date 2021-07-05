//
//  HomeNetworkServiceProtocol.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

protocol HomeNetworkServiceProtocol {
    func fetchCatsPictures(page: Int, limit: Int, completion: @escaping (Result<[CatPicture], Error>) -> Void)
}

extension HomeNetworkServiceProtocol {
    func fetchCatsPictures(page: Int, limit: Int, completion: @escaping (Result<[CatPicture], Error>) -> Void) {
        let service = HomeNetworkService()
        return service.fetchCatsPictures(page: page, limit: limit, completion: completion)
    }
}
