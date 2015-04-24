//
//  RYSearchTagView.h
//  RYSearch
//
//  Created by Robert on 15/4/24.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RYSearchTagView;

@protocol RYSearchTagViewDelegate <NSObject>

- (void)theTagsContent:(NSString *)tagsContent;

@end

@interface RYSearchTagView : UIView

@property (nonatomic, assign) id<RYSearchTagViewDelegate> delegate;

@end
