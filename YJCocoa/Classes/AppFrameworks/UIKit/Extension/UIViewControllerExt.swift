//
//  UIViewControllerExt.swift
//  Pods
//
//  Created by 阳君 on 2019/8/22.
//

import UIKit

fileprivate func currentController(with subView: UIView) -> UIViewController? {
    var result: UIViewController?
    for view in subView.subviews {
        if let vc = view.next as? UIViewController {
            result = vc
        }
    }
    return result
}

public extension UIViewController {
    
    /// 当前 UIViewController
    static var current: UIViewController? {
        var result = UIApplication.shared.keyWindow?.rootViewController
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return result
        }
        for subview in keyWindow.subviews {
            if let vc = subview.next as? UIViewController {
                result = vc
            } else if let vc = currentController(with: subview) {
                result = vc
            }
        }
        if let tabBarController = result as? UITabBarController {
            result = tabBarController.selectedViewController
        }
        if let navigationController = result as? UINavigationController {
            result = navigationController.topViewController
        }
        return result
    }
    
    /// 返回上个页面
    /// - parameter animated: 是否动画
    func pop(animated flag: Bool) {
        guard let nc = self.navigationController else {
            self.dismiss(animated: flag, completion: nil)
            return
        }
        if (nc.viewControllers.count == 1) {
            self.dismiss(animated: flag, completion: nil)
        } else {
            nc.popViewController(animated: flag)
        }
    }
    
}

