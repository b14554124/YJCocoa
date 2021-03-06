//
//  YJUIPageViewController.swift
//  YJCocoa
//
//  HomePage:https://github.com/937447974/YJCocoa
//  YJ技术支持群:557445088
//
//  Created by 阳君 on 2019/5/24.
//  Copyright © 2016-现在 YJCocoa. All rights reserved.
//

import UIKit

@objcMembers
open class YJUIPageViewController: UIPageViewController {

    /// 管理器
    public var manager: YJUIPageViewManager!
    /// cell 数据源
    public var dataSourceCell: Array<YJUIPageViewCellObject> {
        get {return self.manager.dataSourceCell}
        set {self.manager.dataSourceCell = newValue}
    }

    public override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        self.manager = YJUIPageViewManager(pageViewController: self)
        self.dataSource = self.manager
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// 刷新pageVC
    public func reloadData() {
        self.manager.setIndex(0, animated: false)
    }
    
}
