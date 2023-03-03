//
//  ExploreViewController.swift
//  Chat
//
//  Created by Tú Phạm on 23/02/2023.
//

import UIKit

class ExploreViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let array:[Int] = Array(0...10)
    let surveyCell = "SurveyCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: surveyCell, bundle: nil), forCellReuseIdentifier: surveyCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar(title: "アンケート",
                           isShowBackButton: true)
    }
    
//    override func setupNavigationBar(title: String, isShowBackButton: Bool = false) {
//        super.setupNavigationBar(title: title, isShowBackButton: isShowBackButton)
//        let viewTitle = navigationItem.titleView ?? UIView()
//        for item in viewTitle.subviews {
//            item.removeFromSuperview()
//        }
//        let titleLabel = UILabel()
//        let firstText = "10問"
//        let firstTitle = NSMutableAttributedString(string: firstText)
//        firstTitle.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], range: NSRange(location: 0, length: firstText.count))
//        firstTitle.append(NSAttributedString(string: " / 全12問中"))
//        titleLabel.attributedText = firstTitle
//        navigationItem.titleView?.addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.topAnchor.constraint(equalTo: viewTitle.topAnchor).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: viewTitle.bottomAnchor).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: viewTitle.leadingAnchor).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: viewTitle.trailingAnchor).isActive = true
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: surveyCell) as? SurveyCell ?? UITableViewCell()
        return cell
    }
    
}
