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
        getInstagramAPI *API;
        //getInstagramAPI *awaodoriAPI;
        NSInteger jouhouNumber;
}
@synthesize arguments = arguments;
@synthesize arguments_jouhou = arguments_jouhou;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"アギュメンは%@",arguments);
    NSLog(@"情報アギュメンは%@",arguments_jouhou);
    API = [[getInstagramAPI alloc]init];
    API.delegate = self;
    self.imageview.contentMode = UIViewContentModeScaleAspectFit;

    API.sendString = arguments;
    [API timer];

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


//getしたAPIの画像を表示する、ラベルにも関連した情報を表示する
-(void)didGetAPI{
    //デリゲートに保存したimageを取得する
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
    //imageviewの画像をimageに設定
    self.imageview.image = appDelegate.imagesend;
    [self showJouhouLabel];
}

- (IBAction)backbutton:(UIButton *)sender {
    [API timerStop];
}

-(void)showJouhouLabel{
    //pilistから情報を呼び出す
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString *path = [bundle pathForResource:arguments_jouhou ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"arrayの中身は%ld",array.count);
    
    self.jouhouLabel.numberOfLines = 10;
    self.jouhouLabel.text = [array objectAtIndex:jouhouNumber];
    //if (jouhouNumber < array.count) {
       jouhouNumber++;
    //}else{
        //jouhouNumber = 0;
    //}
}
@end
