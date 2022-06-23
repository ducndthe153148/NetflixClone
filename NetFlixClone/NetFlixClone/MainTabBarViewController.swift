//
//  ViewController.swift
//  NetFlixClone
//
//  Created by MacOS on 23/06/2022.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow

//        setUpTabBar()
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcommingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())

        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }

    func setUpTabBar(){
        let homeVC = HomeViewController();
        let upcomingVC = UpcommingViewController();
        let searchVC = SearchViewController();
        let downloadVC = DownloadsViewController();
        self.viewControllers = [homeVC, upcomingVC, searchVC, downloadVC]
        self.selectedViewController = homeVC
        for (index, item) in self.tabBar.items!.enumerated() {
            switch index {
            default:
                break;
            }
        }
    }
}

