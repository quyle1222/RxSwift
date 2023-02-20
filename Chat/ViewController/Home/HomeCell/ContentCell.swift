//
//  ContentCell.swift
//  Chat
//
//  Created by Tú Phạm on 16/02/2023.
//

import UIKit

class ContentCell: UITableViewCell {
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentIcon: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var likeIcon: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(){
        contentView.layer.backgroundColor = UIColor.white.cgColor
        contentView.layer.cornerRadius = 12
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        postImage.contentMode = .scaleToFill
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("tap")
    }
}
