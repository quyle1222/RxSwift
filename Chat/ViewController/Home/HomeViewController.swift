import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mainTableView: UITableView!
    
    let listContent:[Int] = Array(0...10)
    let storyCellReuseIdentifier = "StoryCellTableViewCell"
    let contentCellReuseIdentifier = "ContentCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        binding()
    }
    
    func configUI() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.register(UINib(nibName: contentCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: contentCellReuseIdentifier)
        mainTableView.register(UINib(nibName: storyCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: storyCellReuseIdentifier)
        mainTableView.allowsSelection = false
        navigationItem.hidesBackButton = true
    }
    
    func binding() {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row){
        case 0:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: storyCellReuseIdentifier) as? StoryCellTableViewCell  ?? UITableViewCell()
            cell.layoutIfNeeded()
            return cell
        default:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: contentCellReuseIdentifier) as? ContentCell ?? UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 130
        default:
            return 380
        }
    }
}
