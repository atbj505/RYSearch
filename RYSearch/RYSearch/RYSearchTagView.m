//
//  RYSearchTagView.m
//  RYSearch
//
//  Created by Robert on 15/4/24.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "RYSearchTagView.h"

@interface RYSearchTagView ()

@property (nonatomic, strong) NSArray *tagsArray;
@end

@implementation RYSearchTagView
- (void)buttonTagsAction:(UIButton *)button {
    NSInteger index = button.tag - 235;
    [self theTagsContent:self.tagsArray[index]];
}

- (void)theTagsContent:(NSString *)tagsContent {
    if ([self.delegate respondsToSelector:@selector(theTagsContent:)])
    {
        [self.delegate theTagsContent:tagsContent];
    }
}

@end
