//
//  HomeCatyCell.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import UIKit
import SDWebImage

class HomeCatyCell: UICollectionViewCell {
    
    // MARK: - UI Views
    @IBOutlet private weak var favouriteButton: UIButton!
    @IBOutlet private weak var catPictureImageView: UIImageView!
    
    // MARK: - Properties
    private var delegate: HomeCellProtocol?
    
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
extension HomeCatyCell {
    func configure(picture: CatPictureUIModel, delegate: HomeCellProtocol) {
        let color: UIColor = picture.isFavourite ? .red : .gray
        
        self.delegate = delegate
        favouriteButton.tintColor = color
        catPictureImageView.sd_setImage(with: URL(string: picture.url))
    }
}
