//
//  UIImage+BlurEffective.h
//  Paopao
//
//  Created by tb on 16/12/19.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BlurEffective)

- (UIImage *)imageByApplyingLightEffect;

- (UIImage *)imageByApplyingExtraLightEffect;

- (UIImage *)imageByApplyingDarkEffect;

- (UIImage *)imageByApplyingTintEffectWithColor:(UIColor *)tintColor;

- (UIImage*)imageByApplyingBlurToImage:(UIImage*)inputImage withRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
