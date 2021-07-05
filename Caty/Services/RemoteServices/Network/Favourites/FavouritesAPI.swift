//
//  FavouritesAPI.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Moya

enum FavouritesAPI {
    case addCatPictureToFavourites(pictureId: String)
    case fetchFavouritesCatsPictures(page: Int, limit: Int)
    case removeCatPictureFromFavourites(favouriteId: String)
}

extension FavouritesAPI: TargetType, EnvironmentProtocol {
    var baseURL: URL {
        let baseURL = getCurrentEnvironment().middlewareBaseURL
        guard let url = URL(string: baseURL) else { fatalError("stringURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .addCatPictureToFavourites:
            return "v1/favourites"
        case .fetchFavouritesCatsPictures:
            return "v1/favourites"
        case .removeCatPictureFromFavourites(let favouriteId):
            return "v1/favourites/\(favouriteId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addCatPictureToFavourites:
            return .post
        case .fetchFavouritesCatsPictures:
            return .get
        case .removeCatPictureFromFavourites:
            return .delete
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
        case .addCatPictureToFavourites(let pictureId):
            let parameters = ["image_id": pictureId] as [String: Any]
            return .requestCompositeParameters(bodyParameters: parameters,
                                               bodyEncoding: JSONEncoding.default,
                                               urlParameters: [:])
            
        case .fetchFavouritesCatsPictures(let page, let limit):
            let parameters = ["page": page,"limit": limit] as [String: Any]
            return .requestParameters(parameters: parameters,
                                      encoding: URLEncoding.default)
            
        case .removeCatPictureFromFavourites:
            return .requestParameters(parameters: [:],
                                      encoding: URLEncoding.default)
        }
    }
}


