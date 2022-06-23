//
//  UICollectionView+Ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 04/11/2021.
//

import Foundation

extension UICollectionView {

    func register<C: UICollectionViewCell>(cellType: C.Type) where C: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseID)
    }

    func register<C: UICollectionViewCell>(cellType: C.Type) where C: NibIdentifiable & Reusable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseID)
    }

    func dequeueReusableCell<C: UICollectionViewCell>(withCellType type: C.Type = C.self, forIndexPath indexPath: IndexPath) -> C where C: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseID, for: indexPath) as? C
            else { fatalError("Couldn't dequeue a UICollectionViewCell with identifier: \(type.reuseID)") }
        return cell
    }
}
