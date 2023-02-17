//
//  ExploreViewController.swift
//  Chat
//
//  Created by Tú Phạm on 15/02/2023.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var loginButon: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI(){
        passwordTextField.enablePasswordToggle()
        navigationItem.hidesBackButton = true
        googleButton.layer.cornerRadius = 12
        loginButon.layer.cornerRadius = 12
    }
}
