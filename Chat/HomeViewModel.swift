import RxSwift
import RxCocoa

protocol ViewControllerViewModelInputs {
    func setMessageError(text:String)
    func handleLogin()
}

protocol ViewControllerViewModelOutPuts {
    var contryResponse: PublishSubject<String> { get }
    var messageError: PublishSubject<String> { get }
    var username: PublishSubject<String> { get set }
    var password: PublishSubject<String> { get set }
}

protocol ViewControllerViewModelType {
    var inputs: ViewControllerViewModelInputs { get }
    var outputs: ViewControllerViewModelOutPuts { get }
}

class HomeViewModel: ViewControllerViewModelType,ViewControllerViewModelOutPuts,ViewControllerViewModelInputs {
    var inputs: ViewControllerViewModelInputs { return self }
    var outputs: ViewControllerViewModelOutPuts { return self }
    private var disposeBag = DisposeBag()
    
    //MARK: - ViewControllerViewModelOutPuts
    var username = PublishSubject<String>()
    var password = PublishSubject<String>()
    var contryResponse = PublishSubject<String>()
    var messageError = PublishSubject<String>()
        
    //MARK: - ViewControllerViewModelInputs
    func setMessageError(text: String) {
        messageError.onNext(text)
    }
    
    func handleLogin(){
        print("handle login")
        username.onNext("")
    }
}
