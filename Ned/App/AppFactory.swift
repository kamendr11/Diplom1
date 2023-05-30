import UIKit

enum AppFactory {
    static func getViewControllers() -> [UIViewController] {
        let homeItem = UITabBarItem(title: nil, image: .TabBar.house, tag: 0)
        let likedItem = UITabBarItem(title: nil, image: .TabBar.heart, tag: 0)
        let profileItem = UITabBarItem(title: nil, image: .TabBar.person, tag: 0)
        UITabBar.appearance().tintColor = .black
        
        
        let homeNC = HomeFactory.getViewController()
        let likedNC = LikedCoordinator().getNavigationController()
        let profileNC = AuthFactory.getNavigationController()
       
        
        homeNC.tabBarItem = homeItem
        
        likedNC.tabBarItem = likedItem
        
        profileNC.tabBarItem = profileItem
        
    
        
    
        
        
        return [homeNC, likedNC, profileNC]
    }
    
    }

