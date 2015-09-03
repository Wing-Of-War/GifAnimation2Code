//
//  UIColor+Motion.h
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/9/3.
//  Copyright © 2015年 Nomemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Motion)

+ (UIColor *)fromColor:(UIColor *)c toColor:(UIColor *)d withProgress:(CGFloat)progress;

@end
