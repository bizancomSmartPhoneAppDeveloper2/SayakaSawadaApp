//
//  ViewController.m
//  AttoTokushima
//
//  Created by ビザンコムマック０４ on 2014/10/08.
//  Copyright (c) 2014年 ビザンコムマック０４. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    //apiのURLを入れる
    NSURL *url;
    //apiのURLの文字列を入れる
    NSString *str;
    //画像のURLを文字列として入れる
    NSString *imgurl;
    //ボタンが押された回数
    NSInteger buttonCount;
    NSMutableArray *ramenArray;
    NSTimer *timer;
    //配列から取り出した要素のURLを入れる
    NSString *ramenstring;
}

-(void)viewWillAppear:(BOOL)animated{
    //apiのURLをまずは文字列として入れておく
    str = @"https://api.instagram.com/v1/tags/徳島ラーメン/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
    //日本語を含むURLをエンコーディングしなければエラーになってしまうのでエンコーディング
    NSString *encodedUrl = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)str, NULL, NULL, kCFStringEncodingUTF8));
    str = encodedUrl;
    //NSURLを作成
    url = [NSURL URLWithString:str];
    
    //imageviewのサイズにアスペクト比を保ったまま合わせる
    self.imageview.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ramenArray = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(UIButton *)sender {
    //if(buttonCount < 20){
    //  nil;
    //}else if (buttonCount == 20){
    //  buttonCount = 0;
    //}
    
    
    
    //apiのURL先にあるデータを入れる
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *err = nil;
    //dataからJSONを生成
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    NSArray *dataArray = [dic objectForKey:@"data"];
    NSLog(@"%ld",dataArray.count);
    for (int i = 0; i < (dataArray.count); i++) {
        NSDictionary *tag_dic = [dataArray objectAtIndex:i];
        NSDictionary *images_dic = [tag_dic objectForKey:@"images"];
        NSDictionary *standard_resolution_dic = [images_dic objectForKey:@"standard_resolution"];
        NSString *imageurl = [standard_resolution_dic objectForKey:@"url"];
        NSLog(@"%@",imageurl);
        [ramenArray addObject:imageurl];
        NSLog(@"%ld",ramenArray.count);
    }

    timer = [NSTimer
             scheduledTimerWithTimeInterval:2
             target: self
             selector:@selector(showRamenImage)
             userInfo:nil
             repeats:YES];

    }

-(void)showRamenImage{
        //ramenArrayからランダムに１枚取り出す
    int pos;//ramenArrayから何番目の要素が取り出されたかを保存する箱
    pos = arc4random()%ramenArray.count;//配列から要素をランダムに取り出す
    ramenstring = ramenArray[pos];//該当の要素番号のURLを代入
    NSLog(@"%d",pos);
    //画像のURLをデータとしてまず入れる
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ramenstring]];
    //imgdataを画像を生成しimageに格納
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    
    //imageviewの画像をimageに設定
    self.imageview.image = image;
    //NSLog(@"%ld",buttonCount);
    //buttonCount++;

}
@end
