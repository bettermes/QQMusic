//
//  BM_MHIntroAdView.m
//  BetterMusic
//
//  Created by len on 16/9/25.
//  Copyright © 2016年 len. All rights reserved.
//

#import "BM_MHIntroAdView.h"

@interface BM_MHIntroAdView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic ,strong)UICollectionView * adCollectionView;
@end
@implementation BM_MHIntroAdView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self configUIWithFrame:frame];
    }
    return self;
}
//config
-(void)configUIWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.adCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:flowLayout];
    self.adCollectionView.backgroundColor = [UIColor clearColor];
    self.adCollectionView.dataSource = self;
    self.adCollectionView.showsHorizontalScrollIndicator = NO;
    self.adCollectionView.delegate = self;
    [self addSubview:self.adCollectionView];
    [self.adCollectionView registerNib:[UINib nibWithNibName:@"BM_tagsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"faceCell"];
}


#pragma mark - delagate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(0, 0);
}


@end
