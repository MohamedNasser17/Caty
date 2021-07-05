//
//  FavouritesCatyCell.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import UIKit
import SDWebImage

class FavouritesCatyCell: UICollectionViewCell {
    
    // MARK: - UI Views
    @IBOutlet private weak var favouriteButton: UIButton!
    @IBOutlet private weak var catPictureImageView: UIImageView!
    
    // MARK: - Properties
    var delegate: FavouritesCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        catPictureImageView.clipsToBounds = true
        catPictureImageView.layer.cornerRadius = 8
    }

    // MARK: - IBAction
    @IBAction func favouriteAction(_ sender: Any) {
        delegate?.updateFavouriteStatus(for: self)
    }
}

// MARK: - Configuration Methods
extension FavouritesCatyCell {
    func configure(picture: CatPictureUIModel, delegate: FavouritesCellProtocol) {
        let color: UIColor = picture.isFavourite ? .red : .gray
        
        self.delegate = delegate
        favouriteButton.tintColor = color
        catPictureImageView.sd_setImage(with: URL(string: picture.url))
    }
}
