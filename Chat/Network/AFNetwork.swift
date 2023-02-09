//
//  AFNetwork.swift
//  Chat
//
//  Created by Tú Phạm on 08/02/2023.
//

import Alamofire

enum KeyENV:String {
    case BASE_URL = "BASE_URL"
    
    var toString:String {
        return self.rawValue
    }
}

enum PathUrl: String {
    case LOGIN = "api/auth/create"
}

class AFNetwork {
    var baseURL:String!
    init(){
        baseURL = Bundle.main.object(forInfoDictionaryKey: KeyENV.BASE_URL.toString) as? String ?? ""
        print("baseURl",baseURL as Any)
    }
    
    func getAPI(url: PathUrl, paramester: Parameters = [:]) -> DataRequest {
        print("paramester",paramester)
        return AF.request(baseURL + url.rawValue,
                          method: .get,
                          parameters: paramester,
                          encoding: JSONEncoding.default)
    }
    
    func postAPI(url: PathUrl, paramester: Parameters = [:]) -> DataRequest {
        print("paramester",paramester)
        return AF.request(baseURL + url.rawValue,
                          method: .post,
                          parameters: paramester,
                          encoding: JSONEncoding.default)
    }
}
