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

@interface showPicture : UIViewController<getInstagramAPIDelegate>{
    //前の画面から受け取る引数
    NSString *arguments;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *jouhouLabel;
@property UIImage *image;
@property(nonatomic,retain) NSURL *imageUrlcatch; // 受け取りプロパティ
@property (nonatomic) NSString *arguments;
@property (nonatomic) NSString *arguments_jouhou;
@property (weak, nonatomic) IBOutlet UILabel *waitingLabel;
- (IBAction)stopRestartButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *stopRestartButtonLabel;

@end


