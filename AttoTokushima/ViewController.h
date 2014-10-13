//
//  ViewController.h
//  AttoTokushima
//
//  Created by ビザンコムマック０４ on 2014/10/08.
//  Copyright (c) 2014年 ビザンコムマック０４. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
- (IBAction)keijibanbutton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *tokushimalabel;
@property (weak, nonatomic) IBOutlet UIImageView *tokushimaView;
@property (weak, nonatomic) IBOutlet UIButton *kazurabashiImage;
@property (weak, nonatomic) IBOutlet UIButton *sudathiImage;
@property (weak, nonatomic) IBOutlet UIButton *narutokintokiImage;
@property (weak, nonatomic) IBOutlet UIButton *awaodoriImage;
@property (weak, nonatomic) IBOutlet UIButton *ramenImage;
@property (weak, nonatomic) IBOutlet UIButton *uzushioImage;
@property (weak, nonatomic) IBOutlet UIButton *tsurugisanImage;
@property (weak, nonatomic) IBOutlet UIButton *kejibanLabel;
- (IBAction)closeWebview:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *apuriTopButton;
- (IBAction)meisanButtons:(UIButton *)sender;
@end

