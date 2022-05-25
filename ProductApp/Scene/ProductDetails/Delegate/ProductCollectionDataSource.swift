//
//  ProductCollectionDataSource.swift
//  ProductApp
//
//  Created by Bruno Fontes on 24/5/22.
//


import UIKit

class ProductCollectionDataSource: NSObject, UICollectionViewDataSource {

    var pictures: [Picture] = []

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pictures.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.nibName,
                                                       for: indexPath)
                as? ProductCollectionViewCell else { return ProductCollectionViewCell() }
        cell.set(imageUrl: pictures[indexPath.row].url)
        return cell
    }
}

