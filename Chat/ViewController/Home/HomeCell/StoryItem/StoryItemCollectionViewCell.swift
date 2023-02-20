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
        viewImage.layer.borderWidth = 1.5
        viewImage.layer.borderColor = UIColor.blue.cgColor
        viewImage.layer.cornerRadius = 12
        viewImage.layer.masksToBounds = true
    }
    
    func setupForAddStoryItem(){
        let boderView = CAShapeLayer()
        boderView.strokeColor = UIColor.blue.cgColor
        boderView.lineDashPattern = [2, 2]
        boderView.frame = viewImage.bounds
        boderView.fillColor = nil
        boderView.path = UIBezierPath(roundedRect: viewImage.bounds,
                                      byRoundingCorners: .allCorners,
                                      cornerRadii: CGSize(width: 12, height: 12)).cgPath
        viewImage.layer.borderWidth = 0
        viewImage.layer.cornerRadius = 0
        viewImage.layer.borderColor = UIColor.clear.cgColor
        viewImage.layer.addSublayer(boderView)
    }
}
