//
//  MoyaBaseService.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Moya

enum NetworkServiceType {
    case live
    case test
}

class MoyaServiceHelper<T:TargetType> {
    
    // MARK:- Properties
    var provider: MoyaProvider<T>!
    
    // MARK:- Init
    init(type: NetworkServiceType = .live) {
        let serviceType = type == .live ? MoyaProvider<T>.neverStub : MoyaProvider<T>.immediatelyStub
        provider = MoyaProvider<T>(stubClosure: serviceType, plugins: [])
    }
    
    func request<R: Codable>(target: T, completion: @escaping (Result<R, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(R.self, from: value.data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

