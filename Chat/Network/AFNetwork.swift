//
//  AFNetwork.swift
//  Chat
//
//  Created by Tú Phạm on 08/02/2023.
//

import Foundation
import Alamofire
enum KeyENV:String {
    case BASE_URL = "BASE_URL"
    
    var toString:String {
        return self.rawValue
    }
}

enum PathUrl: String {
    case LOGIN = "api/auth/login"
}

class AFNetwork {
    var baseURL:String!
    
    init(){
        baseURL = ProcessInfo.processInfo.environment[KeyENV.BASE_URL.toString];
        print("baseURL",baseURL as Any)
        
        guard let mySetting = Bundle.main.object(forInfoDictionaryKey: "MySetting") as? String
            else {
            print("MySetting not found")
            return }
        print("mySetting \(mySetting)")
    }
    
    func getAPI(url:PathUrl){
        
    }
    
    func postAPI(){
        
    }
}
