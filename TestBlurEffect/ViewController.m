//
//  ViewController.m
//  TestBlurEffect
//
//  Created by tb on 16/12/19.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+BlurEffective.h"
#import "UIImage+Color.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *showImgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)blurAction:(id)sender {
    self.showImgView.image = [[UIImage imageNamed:@"hello"] imageByApplyingDarkEffect];
}

- (IBAction)normalAction:(id)sender {
    self.showImgView.image = [UIImage imageNamed:@"hello"];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
