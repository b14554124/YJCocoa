//
//  StringExt.swift
//  YJCocoa
//
//  HomePage:https://github.com/937447974/YJCocoa
//  YJ技术支持群:557445088
//
//  Created by 阳君 on 2019/5/29.
//  Copyright © 2016-现在 YJCocoa. All rights reserved.
//

import UIKit

public extension String {
    
    subscript(r: Range<Int>) -> String {
        guard r.upperBound <= self.count else { return "" }
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy: r.upperBound)
        return String(self[start..<end])
    }
    
    /// 移除前后空格
    func trimWhitespaces()-> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}
