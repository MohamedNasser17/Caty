//
//  EnvironmentProtocol.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

protocol EnvironmentProtocol {
    func getCurrentEnvironment() -> Environment
}

extension EnvironmentProtocol {
    func getCurrentEnvironment() -> Environment {
        return Environment.current
    }
    
    func getAPIAppKey() -> String {
        return Environment.current.apiAppKey
    }
}
