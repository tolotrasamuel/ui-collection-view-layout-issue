//
//  MyCollectionViewCell.swift
//  Tags UI Collection View
//
//  Created by Samuel on 28/03/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    @IBOutlet weak var tagName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
