//
//  RYSearchDelegate.m
//  RYSearch
//
//  Created by Robert on 15/4/24.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "RYSearchDelegate.h"
#import "RYSearchTableViewCell.h"

@interface RYSearchDelegate ()

@property (nonatomic, strong) NSMutableArray *sectionTitles;

@property (nonatomic, strong) NSMutableArray *searchItems;

@property (nonatomic, strong) UILabel *shadeLabel;

@property (nonatomic, strong) RYSearchTagView *searchTagsView;

@end

@implementation RYSearchDelegate

- (void)dealloc {
    [self.searchTagsView removeFromSuperview];
    self.searchTagsView = nil;
    
    [self.shadeLabel removeFromSuperview];
    self.shadeLabel = nil;
}

+ (instancetype)shareInstance {
    static RYSearchDelegate *sharedDelegate;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDelegate = [[self alloc] init];
    });
    return sharedDelegate;
}

- (id)init {
    self = [super init];
    if (self) {
        self.searchItems = [NSMutableArray array];
        self.sectionTitles = [NSMutableArray arrayWithObjects:@"contactPerson",@"group",@"conversations", nil];
        //cell注册
        [RYAppDelegate.vc.displayController.searchResultsTableView registerClass:[RYSearchTableViewCell class] forCellReuseIdentifier:identifier];
    }
    return self;
}

#pragma mark - searchBarDelegate and searchDisplayController
- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    [self.searchItems removeAllObjects];
    self.searchTagsView = [[RYSearchTagView alloc]initWithFrame:CGRectMake(0, 64, KSCREENWIDTH, KSCREENHEIGHT - 64) tagsArrar:@[@"1",@"22"]];
    self.searchTagsView.delegate = self;
    [RYAppDelegate.window addSubview:self.searchTagsView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //添加遮挡视图
    self.shadeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, 20)];
    self.shadeLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:241/255.0 blue:249/255.0 alpha:1];
    [RYAppDelegate.window addSubview:self.shadeLabel];
}

- (void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self.searchTagsView removeFromSuperview];
    self.searchTagsView = nil;
    
    [self.shadeLabel removeFromSuperview];
    self.shadeLabel = nil;
    
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView {
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    UIView *topView = searchBar.subviews[0];
    for (UIView *subView in topView.subviews)
    {
        if ([subView isKindOfClass:[UIButton class]])
        {
            UIButton *cannelButton = (UIButton*)subView;
            [cannelButton setTitleEdgeInsets:UIEdgeInsetsMake(4, -4, 0, 0)];
            [cannelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        }
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    UITableView *tableView1 = controller.searchResultsTableView;
    for( UIView *subview in tableView1.subviews )
    {
        if( [subview class] == [UILabel class] )
        {
            UILabel *lbl = (UILabel*)subview;
            lbl.text = @"noResult";
        }
    }
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSCharacterSet *white = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *text = [searchText stringByTrimmingCharactersInSet:white];
    if ([text isEqualToString:@""]) {
        self.searchTagsView.hidden = NO;
        return;
    }
    else {
        self.searchTagsView.hidden = YES;
    }
    static NSTimer *timer = nil;
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    if ([text length] < 2) {
        [self.searchItems removeAllObjects];
        [RYAppDelegate.vc.displayController.searchResultsTableView reloadData];
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(searchWithText:) userInfo:text repeats:NO];
}

- (void)searchWithText:(NSTimer *)timer {
    
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

static NSString *identifier = @"cellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RYSearchTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!cell) {
        cell = [[RYSearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma mark - RYSearchTagViewDelegate
- (void)theTagsContent:(NSString *)tagsContent {
    
}


@end
