//
//  TagsCellTableViewCell.swift
//  Tags UI Collection View
//
//  Created by Samuel on 28/03/2022.
//

import UIKit
class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}

class TagsCell: UITableViewCell {
    
    var tagList: [String] = []
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            let layout = LeftAlignedCollectionViewFlowLayout()
            
            layout.minimumInteritemSpacing = 1
            layout.minimumLineSpacing = 1
            collectionView.collectionViewLayout = layout
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(MyCollectionViewCell.nib, forCellWithReuseIdentifier: "collectionCell")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(tagList: [String]) {
        self.tagList = tagList
        
        collectionView.reloadData()
        let layoutHeight = collectionView.collectionViewLayout
            .collectionViewContentSize.height
        collectionViewHeight.constant = layoutHeight
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension TagsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier:"collectionCell", for: indexPath) as? MyCollectionViewCell
        guard let mycell = cell else{
            return UICollectionViewCell()
        }
        mycell.tagName?.text = tagList[indexPath.row]
        return mycell
    }
    
    func collectionView(_: UICollectionView,
                        layout _: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = tagList[indexPath.row]
        let fontAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular)]
        
                  let stringSize = string.size(withAttributes: fontAttribute)
                  let padding: CGFloat = 25
                  let width = stringSize.width + padding
        return CGSize(width: width, height: 50)
        
        
    }
}
