import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textFieldChangeText: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    var viewmodel: HomeViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    func binding(){
        viewmodel = HomeViewModel()
        viewmodel.outputs.contryResponse.subscribe { (event) in
            print("contryResponse",event)
        }.disposed(by: self.disposeBag)
        textFieldChangeText.rx.text.orEmpty.bind(to: viewmodel.outputs.username).disposed(by: self.disposeBag)
        viewmodel.outputs.username.asObserver().map { String($0) }.bind(to:self.labelName.rx.text).disposed(by: self.disposeBag)
        btnLogin.rx.controlEvent(.touchDown).asObservable().subscribe { event in
            self.viewmodel.inputs.handleLogin()
        }
        .disposed(by: disposeBag)
    }
    
}
