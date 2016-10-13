//
//  BM_SuperViewController.m
//  BetterMusic
//
//  Created by len on 16/9/24.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_SuperViewController.h"

@interface BM_SuperViewController ()

@end

@implementation BM_SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //loadNavataionBar
    [self loadNavigationBar];
    //loadBottomBaces
    [self loadBottomBaceViews];
}

//loadBottomBaces
-(void)loadNavigationBar{
    self.navigationController.navigationBar.opaque = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0/255.0 green:190/255.0 blue:102/255.0 alpha:1];
}

-(void)loadBottomBaceViews{
    UIView * view = [[[NSBundle mainBundle]loadNibNamed:@"BM_MusicBarView" owner:self options:nil]lastObject];
    view.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    [self.tabBarController.tabBar addSubview:view];

}
//loadNavigationBaceViews
-(void)loadNavigationBaceViews{
    
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
