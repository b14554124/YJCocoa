//
//  YJUITableViewManager.m
//  YJTableView
//
//  HomePage:https://github.com/937447974/YJCocoa
//  YJ技术支持群:557445088
//
//  Created by 阳君 on 2016/10/17.
//  Copyright © 2016年 YJCocoa. All rights reserved.
//

#import "YJUITableViewManager.h"
#import "YJNSAspectOrientProgramming.h"
#import "YJNSLog.h"

@interface YJUITableViewManager () {
    YJNSAspectOrientProgramming *_tableViewAOPDelegate; ///< 切面代理
}

@end

@implementation YJUITableViewManager

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        self.dataSourceGrouped = [NSMutableArray array];
        [self.dataSourceGrouped addObject:[NSMutableArray array]];
        self.dataSourceHeader = NSMutableArray.array;
        _tableView = tableView;
        _dataSourceManager = [[YJUITableViewDataSourceManager alloc] initWithManager:self];
        _delegateManager = [[YJUITableViewDelegateManager alloc] initWithManager:self];
        _scrollViewManager = [[YJUIScrollViewManager alloc] initWithScrollView:tableView];
        // 设置默认代理
        [self addTableViewAOPDelegate:_scrollViewManager];
    }
    return self;
}

- (void)addTableViewAOPDelegate:(id)delegate {
    if (!_tableViewAOPDelegate) {
        _tableViewAOPDelegate = [[YJNSAspectOrientProgramming alloc] init];
        [_tableViewAOPDelegate addTarget:_dataSourceManager];
        [_tableViewAOPDelegate addTarget:_delegateManager];
    }
    [_tableViewAOPDelegate addTarget:delegate];
    self.tableView.dataSource = (id<UITableViewDataSource>)_tableViewAOPDelegate;
    self.tableView.delegate = (id<UITableViewDelegate>)_tableViewAOPDelegate;
}

#pragma mark - getter and setter
- (void)setDataSourcePlain:(NSMutableArray<YJUITableCellObject *> *)dataSourcePlain {
    if (!dataSourcePlain) {
        YJLogError(@"[YJCocoa] 数组为空; selector:%@", NSStringFromSelector(_cmd));
        dataSourcePlain = [NSMutableArray array];
    }
    if (self.dataSourceGrouped.count) {
        [self.dataSourceGrouped replaceObjectAtIndex:0 withObject:dataSourcePlain];
    } else {
        [self.dataSourceGrouped addObject:dataSourcePlain];
    }    
}

- (NSMutableArray<YJUITableCellObject *> *)dataSourcePlain {
    return self.dataSourceGrouped.firstObject;
}

- (void)setDelegate:(id<YJUITableViewManagerDelegate>)delegate {
    _delegate = delegate;
    self.scrollViewManager.delegate = delegate;
}

@end
