//
//  Extension+UIView.swift
//  Explore
//
//  Created by MEKARI on 27/03/22.
//

import Foundation
import UIKit

extension UIView {
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nibBundle)
    }
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nibBundle: Bundle? {
        return Bundle(for: Self.self)
    }
    
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
