import UIKit
import RxSwift
import RxCocoa
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    private var disposeBag = DisposeBag()
    let loginToHomeIdentifier = "LoginToHome"
    
    var viewModel:LoginViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        binding()
    }
    
    func configUI(){
        passwordTextField.enablePasswordToggle()
        if let userId = ProfileUseCase.shareInstance.userId, userId.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            DispatchQueue.main.async {
                self.navigationToHome()
            }
        } else {
            loginButton.layer.cornerRadius = 10
            googleButton.layer.cornerRadius = 10
        }
    }
    
    func binding(){
        viewModel = LoginViewModel()
        viewModel.delegate = self
        let output = viewModel.tranform(input: LoginViewModel.Input(
            username: usernameTextField.rx.text.orEmpty.asObservable(),
            password: passwordTextField.rx.text.orEmpty.asObservable(),
            didTapLogin: loginButton.rx.controlEvent(.touchDown).asObservable(),
            didTapGoogleLogin: googleButton.rx.controlEvent(.touchDown).asObservable()))
        output.inValid.asObservable().bind(to: rx.status).disposed(by: disposeBag)
        output.loginStatus.asObservable().bind(to: rx.stateLogin).disposed(by: disposeBag)
    }
    
    func navigationToHome(){
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: TabbarController())
    }
    
    @IBAction func actionGoogleLogin(_ sender: UIButton) {
        loginGoogle()
    }
    
    func loginGoogle(){
        googleButton.isUserInteractionEnabled = false
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) {[weak self] result, error in
            self?.googleButton.isUserInteractionEnabled = true
            guard let self = self, let userId = result?.user.userID , let accessToken = result?.user.accessToken.tokenString else {return}
            ProfileUseCase.shareInstance.accessToken = accessToken
            ProfileUseCase.shareInstance.userId = userId
            self.navigationToHome()
        }
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

