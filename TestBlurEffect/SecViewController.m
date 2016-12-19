//
//  SecViewController.m
//  TestBlurEffect
//
//  Created by tb on 16/12/19.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import "SecViewController.h"
#import "UIImage+BlurEffective.h"
#import "UIImage+Color.h"

#define imageURL @"http://img02.tooopen.com/images/20141231/sy_78327074576.jpg"
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define kImagePath [NSString stringWithFormat:@"%@/testImage.JPG",kDocumentPath]


#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RandomColor RGBA(arc4random()%256,arc4random()%256,arc4random()%256,(arc4random()%11)/10.0)

@interface SecViewController ()

@property (nonatomic,strong) NSData *imgData;

@property (nonatomic,strong) IBOutlet UILabel *msgLabel;

@property (nonatomic,strong) IBOutlet UIImageView *webImgView;

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url = [NSURL URLWithString:imageURL];
    self.imgData = [NSData dataWithContentsOfURL:url];
    
    NSLog(@"imgPath:%@",kImagePath);
    if ([self.imgData writeToFile:kImagePath atomically:YES]) {
        NSLog(@"写入成功");
        
        UIImage *img = [UIImage imageWithData:self.imgData];
        self.webImgView.image = img;
        self.msgLabel.text = @"Normal Picture";
        
    }else {
        NSLog(@"写入失败");
    }
}


- (IBAction)normalAction:(id)sender {
    self.msgLabel.text = @"Light Effect";
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfFile:kImagePath]];
    self.webImgView.image = [img imageByApplyingLightEffect];
}

- (IBAction)extraLightAction:(id)sender {
    self.msgLabel.text = @"Extra Light Effect";
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfFile:kImagePath]];
    self.webImgView.image = [img imageByApplyingExtraLightEffect];
}


- (IBAction)darkBlur:(id)sender {
    self.msgLabel.text = @"Dark Effect";
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfFile:kImagePath]];
    self.webImgView.image = [img imageByApplyingDarkEffect];
}

- (IBAction)setRandomColorMask:(id)sender {
    self.msgLabel.text = @"RandomColor Blur Effect";
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfFile:kImagePath]];
    self.webImgView.image = [img imageByApplyingTintEffectWithColor:RandomColor];
}

- (IBAction)clearAction:(id)sender {
    self.msgLabel.text = @"Clear Effect";
    self.webImgView.image = nil;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfFile:kImagePath]];
        self.webImgView.image = img;
        self.msgLabel.text = @"Normal Picture";
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
