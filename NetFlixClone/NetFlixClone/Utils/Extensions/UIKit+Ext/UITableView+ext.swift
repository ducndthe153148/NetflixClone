//
//  UITableView+ext.swift
//  Engage-Mobi
//
//  Created by V001695 on 29/10/2021.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseID)
    }

    func register<T: UITableViewCell>(cellType: T.Type) where T: NibIdentifiable & Reusable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseID)
    }

    func registerHeaderFooter<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: Reusable {
        register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.reuseID)
    }

    func registerHeaderFooter<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: NibIdentifiable & Reusable {
        register(viewType.nib, forHeaderFooterViewReuseIdentifier: viewType.reuseID)
    }

    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseID) as? T
            else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.reuseID)") }
        return cell
    }
    
    func dequeueResuableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseID, for: indexPath) as? T
            else { fatalError("Couldn't dequeue a UITableViewCell with identifier: \(type.reuseID)") }
        return cell
    }
    
    func dequeueResuableHeaderFooterView<T: UITableViewHeaderFooterView>(withViewType type: T.Type) -> T where T: Reusable {
        guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: type.reuseID) as? T
            else { fatalError("Couldn't dequeue a UITableViewHeaderFooterView with identifier: \(type.reuseID)") }
        return headerFooterView
    }
    
    func registerCell(for id: String) {
        let nib = UINib(nibName: id, bundle: nil)
        register(nib, forCellReuseIdentifier: id)
    }
}
