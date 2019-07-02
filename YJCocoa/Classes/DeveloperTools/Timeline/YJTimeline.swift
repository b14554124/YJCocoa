//
//  YJTimeline.swift
//  Pods
//
//  Created by 阳君 on 2019/6/18.
//

import UIKit

/// 时间轴记录
@objcMembers
public class YJTimeline: NSObject {
    
    static var log: String?
    static var time: CFAbsoluteTime = 0
    
    /// 添加时间轴步骤
    public static func add(step: String) {
        if self.log == nil {
            self.log = step
        } else {
            let time = String(format: " %.3f", CFAbsoluteTimeGetCurrent() - self.time)
            self.log = self.log! + time + "\n\t" + step
        }
        self.time = CFAbsoluteTimeGetCurrent()
    }
    
    /// 结束并打印日志
    public static func end() {
        guard let log = self.log else {
            return
        }
        let time = String(format: " %.3f", CFAbsoluteTimeGetCurrent() - self.time)
        YJLogDebug(log + time)
        self.log = nil
    }
    
}
