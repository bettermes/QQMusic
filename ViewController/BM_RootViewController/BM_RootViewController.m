//
//  BM_RootViewController.m
//  BetterMusic
//
//  Created by len on 16/9/24.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_RootViewController.h"
#import "BM_MusicNavigationBarViews.h"
#import "BM_Enums.h"
#import "BM_MusicHallViewController.h"

#define SCROLL_WIDTH self.scrollView.bounds.size.width
#define SCROLL_HEIGHT self.scrollView.bounds.size.height

@interface BM_RootViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    BM_MusicNavigationBarViews * _navView;
    BM_MusicHallViewController * homeMusicHallVC;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
//@property BM_ScrollView *scrollView2;
@end

@implementation BM_RootViewController


-(void)awakeFromNib{
    [super awakeFromNib];
}
-(void)updateViewConstraints{
    [super updateViewConstraints];
}
-(void)viewWillAppear:(BOOL)animated{
     //64dp 错位
    self.automaticallyAdjustsScrollViewInsets=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBaceViews];
    [self configController];
}
//初始化控制器
-(void)configController{
    //我的
    //SCREEN_HEIGHT -64 注意这里因为半透明 所以好看一点 不然再减44
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT -64 )];
    
    [self.view addSubview:self.self.scrollView];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *3, SCREEN_HEIGHT - 64);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.canCancelContentTouches = NO;
    
    UIStoryboard * homeSB = [UIStoryboard storyboardWithName:@"BM_HomeStoryboard" bundle:[NSBundle mainBundle]];
    UITableViewController * homeMyTableVC = [homeSB instantiateViewControllerWithIdentifier:@"Home_MySB"];
    homeMyTableVC.tableView.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.scrollView addSubview:homeMyTableVC.tableView];
    
    //音乐库
    homeMusicHallVC = [homeSB instantiateViewControllerWithIdentifier:@"Home_MusicHallSB"];
    homeMusicHallVC.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
   
    [self.scrollView addSubview:homeMusicHallVC.view];
    
    //发现
    UITableViewController * homeFindTableVC = [homeSB instantiateViewControllerWithIdentifier:@"Home_FindSB"];
    homeFindTableVC.tableView.frame = CGRectMake(SCREEN_WIDTH * 2, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
    NSLog(@"frame%@",NSStringFromCGRect(homeFindTableVC.tableView.frame));
    [self.scrollView addSubview:homeFindTableVC.tableView];
    
    self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH , 0);
}


-(void)loadBaceViews{
    
    _navView = [[[NSBundle mainBundle]loadNibNamed:@"BM_MusicNavigationbarView" owner:self options:nil]lastObject];
    _navView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
    [self.navigationController.navigationBar addSubview:_navView];
    __block BM_RootViewController * weakSelf = self;
    
    _navView.block = ^(NAVIGATION_BTN_TAGS tags){
        //处理事件
        [weakSelf changeContentOffsetWithType:tags];
    };
    
}
-(void)changeContentOffsetWithType:(NAVIGATION_BTN_TAGS )tags{
    int page = 0;
    switch (tags) {
        case NAV_MY_BTN:
            page = 0;
            break;
        case NAV_MUSICHALL_BTN:
            page = 1;
            break;
        case NAV_FIND_BTN:
            page = 2;
            break;
        default:
            break;
    }
    self.scrollView.contentOffset = CGPointMake(SCROLL_WIDTH * page, 0);
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"move %lf",scrollView.contentOffset.x);
   
        int page = 0;
        if(scrollView.contentOffset.x <= 0){
            page = 0;
        }else if(scrollView.contentOffset.x <=SCROLL_WIDTH ){
            page = 1;
        }else{
            page = 2;
        }
        //改变字体大小
        [_navView changeBtnFontWithTag:page + 1002];

}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        [scrollView resignFirstResponder];
    }
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
