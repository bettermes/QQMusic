//
//  BM_MusicHallViewController.m
//  BetterMusic
//
//  Created by len on 16/9/25.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_MusicHallViewController.h"
#import "BM_HomeTagsView.h"

@interface BM_MusicHallViewController ()<UIScrollViewDelegate>
{
    BM_HomeTagsView * _tagsView;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewWidth;
@end

@implementation BM_MusicHallViewController

-(void)updateViewConstraints{
    [super updateViewConstraints];
    //不知道为什么加 64 20
}
-(void)viewWillAppear:(BOOL)animated{
    //64dp 错位
    //self.automaticallyAdjustsScrollViewInsets=NO;
}


-(void)awakeFromNib{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBaceViews];
}

-(void)loadBaceViews{
    _tagsView = [[[NSBundle mainBundle]loadNibNamed:@"BM_HomeTagsView" owner:self options:nil]lastObject];
    _tagsView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 45);
    [self.view addSubview:_tagsView];
    __block BM_MusicHallViewController * weakSelf = self;
    _tagsView.block = ^(MUSICHALL_BTN_TAGS tag){
        NSLog(@"clicked tag");
        [weakSelf changeContentOffsetWithType:tag];
    };
}
//changeContentOfset
-(void)changeContentOffsetWithType:(MUSICHALL_BTN_TAGS )tags{
    int page = 0;
    switch (tags) {
        case MH_INTRO_BTN:
            page = 0;
            break;
        case MH_ORDER_BTN:
            page = 1;
            break;
        case MH_LIST_BTN:
            page = 2;
            break;
        case MH_RADIO_BTN:
            page = 1;
            break;
        case MH_MV_BTN:
            page = 2;
            break;
        default:
            break;
    }
    self.scrollView.contentOffset = CGPointMake((SCREEN_WIDTH+16) * page, 0);
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSLog(@"HM_move %lf",scrollView.contentOffset.x);
    int page = 0;
    
    if(scrollView.contentOffset.x <= SCREEN_WIDTH){
        page = 0;
    }else if(scrollView.contentOffset.x <= 2* SCREEN_WIDTH ){
        page = 1;
    }else if(scrollView.contentOffset.x <= 3 * SCREEN_WIDTH ){
        page = 2;
    }else if(scrollView.contentOffset.x <= 4 * SCREEN_WIDTH ){
        page = 3;
    }else{
        page = 4;
    }
    [_tagsView changeBtnTextColorWithTag:page + 1006];
}






















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
