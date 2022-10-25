//
//  ViewController.swift
//  SeSAC2FirebaseExample
//
//  Created by Y on 2022/10/05.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ViewController ViewWillAppear")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        Analytics.logEvent("share_image", parameters: [
//          "name": "name",
//          "full_text": "test text",
//        ])
//
//        Analytics.setDefaultEventParameters([
//          "level_name": "Caverns01",
//          "level_difficulty": 4
//        ])
        
    }
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        present(ProfileViewController(),animated: true)
    }
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
    @IBAction func crashButtonTapped(_ sender: UIButton) {
    }
    
}

class ProfileViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ProfileViewController ViewWillAppear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
}

class SettingViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("SettingViewController ViewWillAppear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}

extension UIViewController {
    
    var topViewController: UIViewController? {
        return self.topViewController(currentViewController: self)
    }
    
    //최상위 뷰컨트롤러를 판단해주는 메서드
    func topViewController(currentViewController: UIViewController) -> UIViewController {
        //탭바야? 탭바면 몇번째 뷰컨이야?
        if let tabBarController = currentViewController as? UITabBarController, let selectedViewController = tabBarController.selectedViewController {
            
            return self.topViewController(currentViewController: selectedViewController)
            
        } else if let navigationController = currentViewController as? UINavigationController, let visibleViewController = navigationController.visibleViewController {
            
            return self.topViewController(currentViewController: visibleViewController)
            
        } else if let presentedViewController = currentViewController.presentedViewController {
            
            return self.topViewController(currentViewController: presentedViewController)
            
        } else {
            
            return currentViewController
            
        }
    }
}
extension UIViewController {
    //class 오버라이드 가능, static 불가능 활용에 따라서 설정
    class func swizzleMethod() {
        let origin = #selector(viewWillAppear)
        let change = #selector(changeViewWillAppear)
        
        guard let originMethod = class_getInstanceMethod(UIViewController.self, origin), let changeMethod = class_getInstanceMethod(UIViewController.self, change) else {
            print("Error")
            return
        }
        
        method_exchangeImplementations(originMethod, changeMethod)
        
    }
            
    @objc func changeViewWillAppear() {
        print("Chnage ViewWillAppear Succeed")
    }
}
