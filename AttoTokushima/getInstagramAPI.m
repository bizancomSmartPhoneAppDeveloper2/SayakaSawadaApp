//
//  getInstagramAPI.m
//  AttoTokushima
//
//  Created by ビザンコムマック０４ on 2014/10/13.
//  Copyright (c) 2014年 ビザンコムマック０４. All rights reserved.
//

#import "getInstagramAPI.h"

@implementation getInstagramAPI{
    NSURL *url;
    NSString *imgurl;
    NSInteger pictureCount;
    NSTimer *timer;
    NSString *str;
}

-(void)timer{
    timer = [NSTimer
             scheduledTimerWithTimeInterval:3
             target: self
             selector:@selector(getAPI)
             userInfo:nil
             repeats:YES];
    _MoveTimer = YES;
}

-(void)getAPI{
    //apiのURLをまずは文字列として入れておく
    str = _sendString;
    //日本語を含むURLをエンコーディングしなければエラーになってしまうのでエンコーディング
    NSString *encodedUrl = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)str, NULL, NULL, kCFStringEncodingUTF8));
    str = encodedUrl;
    //NSURLを作成
    url = [NSURL URLWithString:str];
    
    //apiのURL先にあるデータを入れる
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *err = nil;
    //dataからJSONを生成
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    NSArray *dataArray = [dic objectForKey:@"data"];
    NSDictionary *tag_dic = [dataArray objectAtIndex:pictureCount];
    NSDictionary *images_dic = [tag_dic objectForKey:@"images"];
    NSDictionary *standard_resolution_dic = [images_dic objectForKey:@"standard_resolution"];
    imgurl = [standard_resolution_dic objectForKey:@"url"]; // デリゲートプロパティに値代入
    NSLog(@"%@",imgurl);
    
    //画像のURLをデータとしてまず入れる
    _imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgurl]];
    
    //画像を生成しimageに入れる
    _image = [[UIImage alloc] initWithData:_imageData];
    //imagedataを他クラスから参照するので、appに保存する
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
    appDelegate.imagesend = _image; // デリゲートプロパティに値代入
    //APIをゲットした事をデリゲート先に伝える
    [self.delegate didGetAPI];
    
    NSLog(@"%ld",pictureCount);
    NSLog(@"写真の枚数は%ld",dataArray.count);
    
    if (pictureCount < dataArray.count-1) {
        pictureCount++;
    }else{
        pictureCount = 0;
    }
    
    
}

-(void)timerStop{
    [timer invalidate];
    NSLog(@"タイマーストップ");
    _MoveTimer = NO;
}

@end
