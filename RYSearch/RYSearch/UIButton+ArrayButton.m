//
//  UIButton+ArrayButton.m
//  RYSearch
//
//  Created by Robert on 15/4/24.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "UIButton+ArrayButton.h"

static const int TextFount = 13;
static const int ButtonHeight = 26;
int Left = 10;
int Top = 50;

@implementation UIButton (ArrayButton)

+ (NSArray *)ButtonWithArray:(NSArray *)array Gap:(NSUInteger)gap {
    NSMutableArray *buttonArray = [NSMutableArray array];
    
    int totalX = 0;
    int totalY = 0;
    for (int i = 0; i < array.count; i++) {
        NSString *title = array[i];
        UIButton *button = [[self alloc] buttonSetting];
        [button setTitle:title forState:UIControlStateNormal];
        button.tag = i;
        
        int ButtonX = Left + totalX;
        int ButtonY = Top + totalY;
        
        button.frame = CGRectMake(ButtonX, ButtonY, KSCREENWIDTH, ButtonHeight);
        [button sizeToFit];
        
        int ButtonWidth = button.bounds.size.width;
        totalX += ButtonWidth + gap;
        
        if (totalX >= KSCREENWIDTH) {
            totalX = 0;
            totalY += ButtonHeight + 5;
        }
        
        [buttonArray addObject:button];
    }
    return buttonArray;
}

//button基本设置
- (UIButton *)buttonSetting {
    UIButton *button = [[UIButton alloc] init];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blackColor]];
    button.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    button.titleLabel.font = [UIFont systemFontOfSize:TextFount];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.layer.cornerRadius = 5;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth = 1;
    return button;
}

@end
