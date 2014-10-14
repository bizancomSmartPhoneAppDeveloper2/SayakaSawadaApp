//
//  showPicture.m
//  AttoTokushima
//
//  Created by ビザンコムマック０４ on 2014/10/13.
//  Copyright (c) 2014年 ビザンコムマック０４. All rights reserved.
//

#import "showPicture.h"

@interface showPicture ()

@end

@implementation showPicture{
        getInstagramAPI *ramenAPI;
        getInstagramAPI *awaodoriAPI;
        NSInteger jouhouNumber;
}
@synthesize arguments = arguments;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"アギュメンは%@",arguments);
    ramenAPI = [[getInstagramAPI alloc]init];//さっき準備したmyCarをインスタンス化
    ramenAPI.delegate = self;
    awaodoriAPI = [[getInstagramAPI alloc]init];
    awaodoriAPI.delegate = self;
    
    
    self.imageview.contentMode = UIViewContentModeScaleAspectFit;

    ramenAPI.sendString = arguments;
        //ramenAPI.sendString = @"https://api.instagram.com/v1/tags/徳島ラーメン/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
    
        [ramenAPI timer];
   
        //awaodoriAPI.sendString = @"https://api.instagram.com/v1/tags/阿波おどり/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        //[awaodoriAPI timer];
    

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



-(void)didGetAPI{
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
    //imageviewの画像をimageに設定
    self.imageview.image = appDelegate.imagesend;
    
    //pilistから情報を呼び出す
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"jouhou" ofType:@"plist"];
    NSArray* dic = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"arrayの中身は%ld",dic.count);
    
    self.jouhouLabel.numberOfLines = 10;
    self.jouhouLabel.text = [dic objectAtIndex:jouhouNumber];
    jouhouNumber++;
}

- (IBAction)backbutton:(UIButton *)sender {
    [ramenAPI timerStop];
    
}


@end
