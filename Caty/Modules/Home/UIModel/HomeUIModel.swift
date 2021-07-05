//
//  HomeUIModel.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import Foundation

struct HomeUIModel {
    
    // MARK: - Properties
    var page: Int = 0
    let limit: Int = 30
    var isLoading: Bool = false
    var picturesDatasource = [CatPictureUIModel]()
}
