//
//  BaseViewController.swift
//  Chat
//
//  Created by Tú Phạm on 28/02/2023.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupNavigationBar(title: String, isShowBackButton: Bool = false) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.titleView = setupTitle(title: title)
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        if isShowBackButton {
            let buttonLeft = UIBarButtonItem()
            buttonLeft.image = UIImage(named: "closeIcon")
            navigationItem.leftBarButtonItem = buttonLeft
        }
    }
    
    func setupTitle(title:String)-> UIView {
        let titleView = UIView()
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
        return titleView
    }
}
