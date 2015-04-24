//
//  ViewController.h
//  RYSearch
//
//  Created by Robert on 15/4/24.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYSearchBar.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) RYSearchBar *searchBar;

@property (nonatomic, strong) UISearchDisplayController *displayController;

@end

