//
//  getInstagramAPI.h
//  AttoTokushima
//
//  Created by ビザンコムマック０４ on 2014/10/13.
//  Copyright (c) 2014年 ビザンコムマック０４. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@protocol getInstagramAPIDelegate<NSObject>//デリゲートすることを宣言
-(void)didGetAPI;//デリゲートメソッド
@end

@interface getInstagramAPI : NSObject
@property id<getInstagramAPIDelegate> delegate;
@property NSData *imageData;
@property UIImage *image;
@property NSString *imageurl;
@property NSString *sendString;
@property BOOL MoveTimer;
-(void)timer;
-(void)getAPI;
-(void)timerStop;
@end