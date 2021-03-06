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
    NSString *keijibanString;
    NSInteger tag;
}

-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView.hidden = YES;
    self.ramenImage.hidden = NO;
    self.uzushioImage.hidden = NO;
    self.sudathiImage.hidden = NO;
    self.awaodoriImage.hidden = NO;
    self.narutokintokiImage.hidden = NO;
    self.kazurabashiImage.hidden = NO;
    self.tokushimalabel.hidden = NO;
    self.tokushimaView.hidden = NO;
    self.tsurugisanImage.hidden = NO;
    self.hatenaImage.hidden = NO;
    self.topLabel.hidden = NO;
    self.topLabel_1.hidden = NO;
    self.apuriTopButton.hidden = YES;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)keijibanbutton:(UIButton *)sender {
    self.webView.hidden = NO;
    self.apuriTopButton.hidden = NO;
    self.ramenImage.hidden = YES;
    self.uzushioImage.hidden = YES;
    self.sudathiImage.hidden = YES;
    self.awaodoriImage.hidden = YES;
    self.narutokintokiImage.hidden = YES;
    self.kazurabashiImage.hidden = YES;
    self.tokushimaView.hidden = YES;
    self.tokushimalabel.hidden = YES;
    self.tsurugisanImage.hidden = YES;
    self.hatenaImage.hidden = YES;
    self.kejibanLabel.hidden = YES;
    self.topLabel.hidden = YES;
    self.topLabel_1.hidden = YES;


    keijibanString = @"http://sayaka-sawada.main.jp/keijiban/";
    NSURL *keijbanUrl = [NSURL URLWithString:keijibanString];
    NSURLRequest *request = [NSURLRequest requestWithURL:keijbanUrl];
    [self.webView loadRequest:request];
}

- (IBAction)goBackHome:(UIStoryboardSegue *)segue{
    NSLog(@"Exitで戻る　%@",segue.identifier);
    
}

- (IBAction)closeWebview:(UIButton *)sender {
    self.webView.hidden = YES;
    self.ramenImage.hidden = NO;
    self.uzushioImage.hidden = NO;
    self.sudathiImage.hidden = NO;
    self.awaodoriImage.hidden = NO;
    self.narutokintokiImage.hidden = NO;
    self.kazurabashiImage.hidden = NO;
    self.tokushimaView.hidden = NO;
    self.tokushimalabel.hidden = NO;
    self.tsurugisanImage.hidden = NO;
    self.hatenaImage.hidden = NO;
    self.kejibanLabel.hidden = NO;
    self.apuriTopButton.hidden = YES;
    self.topLabel.hidden = NO;
    self.topLabel_1.hidden = NO;

}

//画面遷移時に呼ばれるメソッド
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"ramenSegue"]) {
        //ここでパラメータを渡す
        arguments = @"https://api.instagram.com/v1/tags/徳島ラーメン/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        arguments_jouhou = @"jouhou";

        
                
    }else if ([segue.identifier isEqualToString:@"uzushioSegue"]){
        arguments = @"https://api.instagram.com/v1/tags/渦潮/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        arguments_jouhou = @"jouhouUzushio";

    }else if ([segue.identifier isEqualToString:@"tsurugisanSegue"]){
        arguments = @"https://api.instagram.com/v1/tags/剣山/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        arguments_jouhou = @"tsurugisan";

        
    }else if ([segue.identifier isEqualToString:@"awaodoriSegue"]){
        arguments = @"https://api.instagram.com/v1/tags/阿波踊り/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        arguments_jouhou = @"awaodori";

    }else if ([segue.identifier isEqualToString:@"kazurabashiSegue"]){
        arguments = @"https://api.instagram.com/v1/tags/かずら橋/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        arguments_jouhou = @"kazurabashi";

    }else if ([segue.identifier isEqualToString:@"sudathiSegue"]){
        arguments = @"https://api.instagram.com/v1/tags/すだち/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        arguments_jouhou = @"sudathi";

    }else if ([segue.identifier isEqualToString:@"narutokintokiSegue"]){
        arguments = @"https://api.instagram.com/v1/tags/鳴門金時/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        arguments_jouhou = @"narutokintoki";

    }else if ([segue.identifier isEqualToString:@"hatenaSegue"]){
        arguments = @"https://api.instagram.com/v1/tags/徳島/media/recent?access_token=1317256297.4391fe2.f80770052f314ee790ef15658d0a2c3e&count=100";
        arguments_jouhou = @"hatena";
        
    }

    
    showPicture *secondViewController = segue.destinationViewController;
    secondViewController.arguments = arguments;
    secondViewController.arguments_jouhou = arguments_jouhou;

}
@end
