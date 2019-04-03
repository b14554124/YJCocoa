//
//  YJTimeProfiler.h
//  YJTimeProfiler
//
//  HomePage:https://github.com/937447974/YJCocoa
//  YJ技术支持群:557445088
//
//  Created by 阳君 on 2017/1/11.
//  Copyright © 2017年 YJCocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 时间分析器*/
@interface YJTimeProfiler : NSObject

@property (nonatomic) NSTimeInterval interval; ///< 帧间隔，默认0.017秒

/**
 *  @abstract 启动
 */
- (void)start;

@end

NS_ASSUME_NONNULL_END
