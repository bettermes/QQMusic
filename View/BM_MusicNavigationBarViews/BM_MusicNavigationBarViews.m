//
//  BM_MusicNavigationBarViews.m
//  BetterMusic
//
//  Created by len on 16/9/24.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_MusicNavigationBarViews.h"

@interface BM_MusicNavigationBarViews()

@property (weak, nonatomic) IBOutlet UIButton *musicHallBtn;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (weak, nonatomic) IBOutlet UIButton *findBtn;

@end

@implementation BM_MusicNavigationBarViews

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)navigationBarBtnClicked:(id)sender {
    NSLog(@"点击了");
    UIButton * button = sender;
    switch (button.tag) {
        case NAV_DETAIL_BTN:
            //详情
            
            break;
        case NAV_MY_BTN:
            //我的
            
            break;
        case NAV_MUSICHALL_BTN:
            //音乐馆
            
            break;
        case NAV_FIND_BTN:
            //发现
            
            break;
        case NAV_SEARCH_BTN:
            //搜索
            
            break;
            
        default:
            break;
    }
    NAVIGATION_BTN_TAGS tag = (int)button.tag;
    self.block(tag);
    //改变字体
    [self changeBtnFontWithTag:tag];
}

//改变字体
-(void)changeBtnFontWithTag:(NAVIGATION_BTN_TAGS )tag{
    for(int i = 1002; i< 1005;i++){
        UIButton * button = [self viewWithTag:i];
        if(tag == i){
            //点击中了
            button.titleLabel.font = [UIFont boldSystemFontOfSize:19];
            button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        }else{
            button.titleLabel.font = [UIFont systemFontOfSize:19 weight:UIFontWeightThin];
            button.contentEdgeInsets = UIEdgeInsetsMake(1, 0, 0, 0);
        }
    }
}

@end
