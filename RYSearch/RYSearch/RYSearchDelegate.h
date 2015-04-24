//
//  RYSearchDelegate.h
//  RYSearch
//
//  Created by Robert on 15/4/24.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYSearchTagView.h"

@interface RYSearchDelegate : NSObject<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate,RYSearchTagViewDelegate>

/**
 *  单例方法
 */
+ (instancetype)shareInstance;

@end
