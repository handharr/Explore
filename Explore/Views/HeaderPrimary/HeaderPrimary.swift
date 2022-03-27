//
//  HeaderPrimary.swift
//  Explore
//
//  Created by MEKARI on 27/03/22.
//

import UIKit

protocol HeaderPrimaryDelegate: AnyObject {
    func updateHeight(height: CGFloat)
}

class HeaderPrimary: UIView {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    // MARK: PRIVATE
    private var defaultHeight: CGFloat = .zero
    // MARK: INJECTION
    var delegate: HeaderPrimaryDelegate?
    
    // MARK: - INIT
    override func awakeFromNib() {
        defaultHeight = self.frame.size.height - descLabel.intrinsicContentSize.height
    }
    
    override func layoutSubviews() {
        delegate?.updateHeight(height: defaultHeight + descLabel.intrinsicContentSize.height)
        print("Cekkk")
    }
    
    // MARK: - PUBLIC METHODS
    func setupUI(title: String, subtitle: String, description: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        descLabel.text = description
    }
}
