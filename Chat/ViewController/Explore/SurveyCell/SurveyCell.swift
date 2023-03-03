//
//  SurveyCell.swift
//  Chat
//
//  Created by Tú Phạm on 28/02/2023.
//

import UIKit

class SurveyCell: UITableViewCell {
    @IBOutlet weak var mainView:UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configUI(){
        selectionStyle = .none
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowRadius = 6
        mainView.layer.shadowOpacity = 0.2
        mainView.layer.shadowOffset = .zero
    }
}
