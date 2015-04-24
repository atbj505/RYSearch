//
//  RYSearchDelegate.m
//  RYSearch
//
//  Created by Robert on 15/4/24.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "RYSearchDelegate.h"

@interface RYSearchDelegate ()

@property (nonatomic, strong) NSMutableArray *sectionTitles;

@property (nonatomic, strong) NSMutableArray *searchBuddys;

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
        self.searchBuddys = [NSMutableArray array];
        self.sectionTitles = [NSMutableArray arrayWithObjects:@"contactPerson",@"group",@"conversations", nil];
    }
    return self;
}

#pragma mark - searchBarDelegate and searchDisplayController
- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    [self.searchBuddys removeAllObjects];
    self.searchTagsView = [[RYSearchTagView alloc]initWithFrame:CGRectMake(0, 64, KSCREENWIDTH, KSCREENHEIGHT - 64)];
    self.searchTagsView.delegate = self;
    [IMAPP_DELEGATE.window addSubview:self.searchTagsView];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //添加遮挡视图
    self.shadeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KSCREENWIDTH, 20)];
    self.shadeLabel.backgroundColor = [UIColor colorWithRed:242/255.0 green:241/255.0 blue:249/255.0 alpha:1];
    [IMAPP_DELEGATE.window addSubview:self.shadeLabel];
}
#pragma mark - RYSearchTagViewDelegate
- (void)theTagsContent:(NSString *)tagsContent
{
    
}
@end
