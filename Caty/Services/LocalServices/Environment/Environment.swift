//
//  Environment.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

public enum Environment: String {
    case live
    case dev
    
    // MARK: - Current Enviroment
    static var current: Environment {
        let env = dev
        return Environment(rawValue: env.rawValue) ?? .dev
    }
    
    // MARK: -  Middleware
    var serverMainDomain: String {
        switch self {
        case .dev:
            return "thecatapi.com"
        case .live:
            return "thecatapi.com"
        }
    }
    
    var middlewareDomain: String {
        return "api.\(serverMainDomain)"
    }
    
    var middlewareBaseURL: String {
        return "https://\(middlewareDomain)/"
    }
    
    var apiAppKey: String {
        // TODO: - value should be move to secure place
        return "cee8e03d8fd8555ec0f85716122a1466"
    }
}


