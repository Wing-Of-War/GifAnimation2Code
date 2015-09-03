//
//  UIColor+Motion.m
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/9/3.
//  Copyright © 2015年 Nomemo. All rights reserved.
//

#import "UIColor+Motion.h"

@implementation UIColor (Motion)


+ (UIColor *)fromColor:(UIColor *)c toColor:(UIColor *)d withProgress:(CGFloat)progress {
    CGFloat r, g, b, a;
    CGFloat r2, g2, b2, a2;
    [c getRed:&r green:&g blue:&b alpha:&a];
    [d getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    return [UIColor colorWithRed:(r2 - r) * progress + r
                           green:(g2 - g) * progress + g
                            blue:(b2 - b) * progress + b
                           alpha:a];
    return nil;
}

@end
