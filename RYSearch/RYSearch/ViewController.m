//
//  ViewController.m
//  RYSearch
//
//  Created by Robert on 15/4/24.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "ViewController.h"
#import "RYSearchDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}

- (void)initialize {
    self.title = @"RYSearch";
    [self addTableView];
    [self addSearchBar];
    [self addDisplayController];
}
- (void)addTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, KSCREENHEIGHT - 44) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
}
- (void)addSearchBar {
    _searchBar = [[RYSearchBar alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, 44)];
    //移除serachBar的背景色
    [[[[[_searchBar subviews] objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
    [_searchBar setBackgroundColor:[UIColor colorWithRed:242/255.0 green:241/255.0 blue:249/255.0 alpha:1]];
    _searchBar.placeholder = @"Search";
    _searchBar.delegate = [RYSearchDelegate shareInstance];
    [_searchBar setSearchFieldBackgroundPositionAdjustment:UIOffsetMake(0, 0)];
    _tableView.tableHeaderView = _searchBar;
}

- (void)addDisplayController {
    _displayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _displayController.delegate = [RYSearchDelegate shareInstance];
    _displayController.searchResultsDataSource = [RYSearchDelegate shareInstance];
    _displayController.searchResultsDelegate = [RYSearchDelegate shareInstance];
    _displayController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _displayController.active = NO;
}
@end
