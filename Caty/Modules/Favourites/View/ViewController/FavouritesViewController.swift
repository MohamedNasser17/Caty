//
//  FavouritesViewController.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import UIKit

class FavouritesViewController: UIViewController, FavouritesViewProtocol {
    
    // MARK: - UI Views
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var presenter: FavouritesPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.loadFavourites()
    }

}

// MARK: - Helper Methods
extension FavouritesViewController {
    private func setupUI() {
        title = "Favourites"
        collectionViewDelegates()
        setupCollectionViewLayout()
        registerCollectionViewCells()
    }
    
    private func registerCollectionViewCells() {
        let nib = UINib(nibName: "FavouritesCatyCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "FavouritesCatyCell")
    }
    
    private func collectionViewDelegates() {
        collectionView.dataSource = self
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        let edge = collectionView.frame.width / 2
        layout.itemSize = CGSize(width: edge, height: edge)
        
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

// MARK: - FavouritesViewProtocol Methods
extension FavouritesViewController {
    
    func updateCollectionView() {
        collectionView.reloadData()
    }
    
    func removeCell(index: Int) {
        collectionView.deleteItems(at: [IndexPath(row: index, section: 0)])
    }
    
    func updateFavouriteStatus(for cell: FavouritesCatyCell) {
        if let index = collectionView.indexPath(for: cell)?.row {
            presenter?.updatePictureFavouriteStatus(index: index)
        }
    }
}

// MARK: - CollectionView DataSource & Delegate Methods
extension FavouritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.uiModel.picturesDatasource.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouritesCatyCell", for: indexPath) as? FavouritesCatyCell
        let picture = presenter?.uiModel.picturesDatasource[indexPath.row] ?? CatPictureUIModel()
        cell?.configure(picture: picture, delegate: self)
        return cell ?? FavouritesCatyCell()
    }
}
