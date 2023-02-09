import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    private var disposeBag = DisposeBag()
    
    var viewModel:LoginViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        binding()
    }
    
    func configUI(){
        loginButton.layer.cornerRadius = 12
    }
    
    func binding(){
        viewModel = LoginViewModel()
        let output = viewModel.tranform(input: LoginViewModel.Input(
            username: usernameTextField.rx.text.orEmpty.asObservable(),
            password: passwordTextField.rx.text.orEmpty.asObservable(),
            didTapLogin: loginButton.rx.controlEvent(.touchDown).asObservable()))
        output.inValid.asObservable().bind(to: rx.status).disposed(by: disposeBag)
        output.loginStatus.asObservable().bind(to: rx.stateLogin).disposed(by: disposeBag)
    }
}

extension Reactive where Base: LoginViewController {
    var status: Binder<Bool> {
        return Binder(self.base) { (vc, value) in
            vc.loginButton.isUserInteractionEnabled = value
        }
    }
    var stateLogin: Binder<statusLogin> {
        return Binder(self.base) { (vc, value) in
            print(value)
        }
    }
}

