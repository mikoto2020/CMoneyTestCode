//
//  SecondViewCollectionViewCell.swift
//  CMoneyTestCode
//
//  Created by Jeanne on 2021/8/28.
//

import UIKit

class SecondViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelWidthConstraint: NSLayoutConstraint!
    
    static let width = floor((UIScreen.main.bounds.width - 3 * 3) / 4)

    override func awakeFromNib() {
        super.awakeFromNib()
        widthConstraint.constant = Self.width
        labelWidthConstraint.constant = Self.width
        titleLabel.textColor = .white
    }
    
    
}
