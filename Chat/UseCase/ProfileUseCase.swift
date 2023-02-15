import Foundation

class ProfileUseCase: NSObject {
    static let shareInstance = ProfileUseCase()
    var userId:String?   {
        didSet {
            print("userId",userId)
        }
    }
    var accessToken:String? {
        didSet {
            print("accessToken",accessToken)
        }
    }
}
