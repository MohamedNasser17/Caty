//
//  HomeAPI.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Moya

enum HomeAPI {
    case fetchCatsPictures(page: Int, limit: Int)
}

extension HomeAPI: TargetType, EnvironmentProtocol {
    var baseURL: URL {
        let baseURL = getCurrentEnvironment().middlewareBaseURL
        guard let url = URL(string: baseURL) else { fatalError("stringURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchCatsPictures: return "v1/images/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .fetchCatsPictures:
                return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var task: Task {
        switch self {
        case .fetchCatsPictures(let page, let limit):
            let parameters = ["page": page,"limit": limit] as [String: Any]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
}

