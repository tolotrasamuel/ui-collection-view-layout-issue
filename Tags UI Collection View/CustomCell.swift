//
//  CustomCell.swift
//  Tags UI Collection View
//
//  Created by Samuel on 28/03/2022.
//

import Foundation
import UIKit
class CustomCell: UITableViewCell {
    @IBOutlet weak var mycellTitle: UILabel!
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
}
