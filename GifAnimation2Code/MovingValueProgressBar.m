//
//  MovingValueProgressBar.m
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/8/25.
//  Copyright (c) 2015年 Nomemo. All rights reserved.
//

#import "MovingValueProgressBar.h"

@interface MovingValueProgressBar ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger percent;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation MovingValueProgressBar


- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0,0, 200, 21)];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        UIView *centerLine = [[UIView alloc]initWithFrame:CGRectMake(0, 10, 200, 1)];
        centerLine.backgroundColor = [UIColor blackColor];
        [self addSubview:centerLine];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 10, 21)];
        _label.backgroundColor = self.backgroundColor;
//        _label.backgroundColor = [UIColor redColor];
        _label.text = @"0%";
        [_label sizeToFit];
        [self addSubview:_label];
    }
    return self;
}

- (void)start {
    CABasicAnimation *positionAnim = [CABasicAnimation animationWithKeyPath:@"position"];

    
    CGFloat startWidth = CGRectGetWidth(self.label.frame);
    CGPoint startPoint = CGPointMake(startWidth/2, 10);
    CGFloat duration = 3.0;

    self.label.text = @"100%";
    [self.label sizeToFit];
    CGFloat endWidth = CGRectGetWidth(self.label.frame);
    CGPoint endPoint = CGPointMake(200-endWidth/2, 10);
    self.label.text = @"0%";
    
    positionAnim.fromValue = [NSValue valueWithCGPoint:startPoint];
    positionAnim.toValue = [NSValue valueWithCGPoint:endPoint];
    positionAnim.duration = duration;
    [self.label.layer addAnimation:positionAnim forKey:nil];
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:duration/100 target:self selector:@selector(updateLableText) userInfo:nil repeats:YES];
    self.label.center = endPoint;
}

- (void)updateLableText {
    if (self.percent == 100) {
        [self.timer invalidate];
        self.timer = nil;
        return;
    }
    self.percent ++;
    self.label.text = [NSString stringWithFormat:@"%@%%",@(self.percent)];
    [self.label sizeToFit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
