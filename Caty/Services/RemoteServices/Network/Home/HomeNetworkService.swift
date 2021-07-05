//
//  HomeNetworkService.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

class HomeNetworkService: MoyaServiceHelper<HomeAPI>, HomeNetworkServiceProtocol {
    func fetchCatsPictures(page: Int, limit: Int, completion: @escaping (Result<[CatPicture], Error>) -> Void) {
        request(target: .fetchCatsPictures(page: page, limit: limit), completion: completion)
    }
}
