import RxSwift
import RxCocoa

enum statusLogin:Int {
    case unuse = 0
    case loading = 1
    case fail = 2
    case success = 3
}

class LoginViewModel {
    struct Input {
        let username: Observable<String>
        let password: Observable<String>
        let didTapLogin: Observable<Void>
        let didTapGoogleLogin: Observable<Void>
    }
    
    struct Output {
        let inValid:Driver<Bool>
        let loginStatus: Driver<statusLogin>
    }
    var delegate:LoginViewController?
    var username = BehaviorSubject<String>(value: "")
    var password = BehaviorSubject<String>(value: "")
    var state = PublishSubject<statusLogin>()
    var network = AFNetwork()
    private var disposeBag = DisposeBag()
    
    var isValidUsername: Observable<Bool> {
        return self.username.asObservable().map { username in
            username.count >= 6
        }
    }
    
    var isValidPassword: Observable<Bool> {
        return self.password.asObservable().map { password in
            password.count >= 6
        }
    }
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(isValidUsername, isValidPassword) {$0 && $1}
    }
    
    func tranform(input: Input)->Output{
        input.username.bind(to: username).disposed(by: disposeBag)
        input.password.bind(to: password).disposed(by: disposeBag)
        input.didTapLogin.subscribe { _ in
            guard let username = try? self.username.value(), let password = try? self.password.value() else {return}
            self.login(username: username, password: password).asObservable().subscribe { statusLogin in
                self.state.onNext(statusLogin)
            }.disposed(by: self.disposeBag)
        }.disposed(by: disposeBag)
        let output = Output(inValid: isValid.asDriver(onErrorJustReturn: false),
                            loginStatus: state.asDriver(onErrorJustReturn: .unuse))
        return output
    }
    
    func login(username:String,password:String)-> Observable<statusLogin> {
        print("login username:\(username), password: \(password)")
        return Observable.create { observble in
            observble.onNext(.loading)
            AuthRespository().requestLogin(data: AuthInput(username: username, password: password)).asObservable().subscribe { output in
              
            }.disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
}
