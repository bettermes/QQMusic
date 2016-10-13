//
//  BM_MusicNavigationBarViews.h
//  BetterMusic
//
//  Created by len on 16/9/24.
//  Copyright © 2016年 len. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BM_Enums.h"

//回调
typedef void (^BtnClickedCallBackBlock) (NAVIGATION_BTN_TAGS tag);

@interface BM_MusicNavigationBarViews : UIView
@property(nonatomic ,copy)BtnClickedCallBackBlock block;
//改变字体
-(void)changeBtnFontWithTag:(NAVIGATION_BTN_TAGS )tag;
@end
