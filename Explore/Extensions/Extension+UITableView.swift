//
//  Extension+UITableView.swift
//  Explore
//
//  Created by MEKARI on 27/03/22.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell<T>(_ cell: T.Type) where T: UITableViewCell {
        let nib = UINib(nibName: String(describing: cell.self), bundle: nil)
        self.register(nib, forCellReuseIdentifier: String(describing: cell.self))
    }
    
    func registerHeaderFooter<T>(_ view: T.Type) where T: UITableViewHeaderFooterView {
        let nib = UINib(nibName: String(describing: view.self), bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: String(describing: view.self))
    }
    
    func dequeueCell<T>(_ cell: T.Type, indexPath: IndexPath) -> T where T: UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: cell.self), for: indexPath)
        guard let vcell = cell as? T else { fatalError() }
        return vcell
    }
}
