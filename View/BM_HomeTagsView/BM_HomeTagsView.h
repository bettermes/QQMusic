//
//  BM_HomeTagsView.h
//  BetterMusic
//
//  Created by len on 16/9/25.
//  Copyright © 2016年 len. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BM_Enums.h"

//回调
typedef void (^BtnClickedCallBackBlock) (MUSICHALL_BTN_TAGS tag);


@interface BM_HomeTagsView : UIView

@property(nonatomic ,copy)BtnClickedCallBackBlock block;
//改变字体颜色
-(void)changeBtnTextColorWithTag:(MUSICHALL_BTN_TAGS )tag;

@end
