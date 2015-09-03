//
//  FaceComment.h
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/9/3.
//  Copyright © 2015年 Nomemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WOWFaceComment : UIView

@property (nonatomic, strong, readwrite)UIColor *topColor;
@property (nonatomic, strong, readwrite)UIColor *midColor;
@property (nonatomic, strong, readwrite)UIColor *bottomColor;
@property (nonatomic, assign, readwrite)CGFloat lineWith;

@property (nonatomic, readonly) CGFloat score;



@end
