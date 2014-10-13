//
//  showPicture.h
//  AttoTokushima
//
//  Created by ビザンコムマック０４ on 2014/10/13.
//  Copyright (c) 2014年 ビザンコムマック０４. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "getInstagramAPI.h"
#import "AppDelegate.h"

@interface showPicture : UIViewController<getInstagramAPIDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property UIImage *image;
@property(nonatomic,retain) NSURL *imageUrlcatch; // 受け取りプロパティ

@end


