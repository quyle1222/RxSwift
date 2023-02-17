//
//  StoryItemCollectionViewCell.swift
//  Chat
//
//  Created by Tú Phạm on 16/02/2023.
//

import UIKit

class StoryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        viewImage.layer.borderWidth = 1
        viewImage.layer.borderColor = UIColor.blue.cgColor
        viewImage.layer.cornerRadius = 12
    }
    
}
