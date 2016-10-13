//
//  BM_HomeTagsView.m
//  BetterMusic
//
//  Created by len on 16/9/25.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_HomeTagsView.h"

@interface BM_HomeTagsView ()
@property (weak, nonatomic) IBOutlet UIView *tagsLineView;

@end

@implementation BM_HomeTagsView
- (IBAction)MHTagsBtnClicked:(id)sender {
    UIButton * btn = sender;
    __block BM_HomeTagsView  * weakSelf = self;
    weakSelf.block((int)btn.tag);
    [self changeBtnTextColorWithTag:(int)btn.tag];
}
//改变字体
-(void)changeBtnTextColorWithTag:(MUSICHALL_BTN_TAGS )tag{
  
    for(int i = 1006; i< 1011;i++){
        UIButton * btn = [self viewWithTag:i];
        if(i == tag){
            //changeColor moveline
            [btn setTitleColor:[UIColor colorWithRed:0/255.0 green:176/255.0 blue:118/255.0 alpha:1] forState:UIControlStateNormal];
            [self movelineWithTtnTag:i];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}

//moveline
-(void)movelineWithTtnTag:(MUSICHALL_BTN_TAGS)tag{
    UIButton * btn = [self viewWithTag:tag];
    CGRect rect = CGRectMake(btn.frame.origin.x + (btn.frame.size.width - self.tagsLineView.frame.size.width)/2.0, self.tagsLineView.frame.origin.y, self.tagsLineView.frame.size.width, self.tagsLineView.frame.size.height);
    [UIView animateWithDuration:0.2 animations:^{
        self.tagsLineView.frame = rect;
    }];
}
@end
