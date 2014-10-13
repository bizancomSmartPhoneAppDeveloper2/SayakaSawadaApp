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
    self.kejibanLabel.hidden = YES;

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
    self.kejibanLabel.hidden = NO;
    self.apuriTopButton.hidden = YES;
}
- (IBAction)meisanButtons:(UIButton *)sender {
    NSLog(@"センダータグは%ld",sender.tag);

        
}
@end
