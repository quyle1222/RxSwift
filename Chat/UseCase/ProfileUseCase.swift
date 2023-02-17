import Foundation

class ProfileUseCase: NSObject {
    static let shareInstance = ProfileUseCase()
    var userId:String?   {
        get {
            return UserDefaults.standard.string(forKey: Constants.USER_ID)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.USER_ID)
        }
    }
    var accessToken:String? {
        get {
            return UserDefaults.standard.string(forKey: Constants.ACCESS_TOKEN)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.ACCESS_TOKEN)
        }
    }
}
