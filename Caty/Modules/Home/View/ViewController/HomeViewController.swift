//
//  HomeViewController.swift
//  Caty
//
//  Created by Mohamed Nasser on 04/07/2021.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    
    // MARK: - UI Views
    private var favouritesButton: UIBarButtonItem!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var presenter: HomePresenterProtocol?
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.loadFirstPage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.refershCatPictures()
    }
}

// MARK: - Helper Methods
extension HomeViewController {
    private func setupUI() {
        title = "Home"
        setupFavouritesButton()
        collectionViewDelegates()
        setupCollectionViewLayout()
        registerCollectionViewCells()
    }
    
    private func registerCollectionViewCells() {
        let nib = UINib(nibName: "HomeCatyCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeCatyCell")
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
    
    private func setupFavouritesButton() {
        favouritesButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(favouritesAction))
        navigationItem.rightBarButtonItem = favouritesButton
    }
    
    @objc func favouritesAction() {
        presenter?.favouritesAction()
    }
}

// MARK: - HomeViewProtocol Methods
extension HomeViewController {
    
    func updateCollectionView() {
        collectionView.reloadData()
    }
    
    func updateCell(index: Int) {
        collectionView.reloadItems(at: [IndexPath(row: index, section: 0)])
    }
    
    func updateFavouriteStatus(for cell: HomeCatyCell) {
        if let index = collectionView.indexPath(for: cell)?.row {
            presenter?.updatePictureFavouriteStatus(index: index)
        }
    }
}

// MARK: - CollectionView DataSource & Delegate Methods
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.uiModel.picturesDatasource.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCatyCell", for: indexPath) as? HomeCatyCell
        let picture = presenter?.uiModel.picturesDatasource[indexPath.row] ?? CatPictureUIModel()
        cell?.configure(picture: picture, delegate: self)
        return cell ?? HomeCatyCell()
    }
}
