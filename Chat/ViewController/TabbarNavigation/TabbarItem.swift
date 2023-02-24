//
//  TabbarItem.swift
//  Chat
//
//  Created by Tú Phạm on 23/02/2023.
//
import UIKit

enum TabItem: String, CaseIterable {
    case home = "home"
    case explore = "explore"
    case friends = "friends"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .explore:
            return ExploreViewController()
        case .friends:
            return UIViewController()
        }
        
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "google")!
        case .explore:
            return UIImage(named: "google")!
        case .friends:
            return UIImage(named: "google")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
