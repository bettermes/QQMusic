//
//  BM_Enums.h
//  BetterMusic
//
//  Created by len on 16/9/24.
//  Copyright © 2016年 len. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum{
//    NAV_DETAIL_BTN = 1001,
//    NAV_MY_BTN,
//    NAV_MUSICHALL_BTN,
//    NAV_FIND_BTN,
//    NAV_SEARCH_BTN,
//
//}NAVIGATION_BTN_ENUMS;

//navigationBarBtnTagType

typedef enum {
    NAV_DETAIL_BTN = 1001,
    NAV_MY_BTN ,
    NAV_MUSICHALL_BTN ,
    NAV_FIND_BTN ,
    NAV_SEARCH_BTN ,
}NAVIGATION_BTN_TAGS ;

//musicHallBtnTagType
typedef enum {
    MH_INTRO_BTN = 1006,
    MH_ORDER_BTN ,
    MH_LIST_BTN ,
    MH_RADIO_BTN ,
    MH_MV_BTN ,
}MUSICHALL_BTN_TAGS ;





@interface BM_Enums : NSObject

@end

