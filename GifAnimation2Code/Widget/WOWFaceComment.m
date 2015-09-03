//
//  FaceComment.m
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/9/3.
//  Copyright © 2015年 Nomemo. All rights reserved.
//

#import "WOWFaceComment.h"
#import "UIColor+Motion.h"


@interface WOWFaceComment()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) CAShapeLayer *lineLayer;
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, assign) CGFloat score;

@end

@implementation WOWFaceComment {

    CGFloat lineLayerCurrentY;
    CGFloat lineLayerY;
    CGPoint lineStartPoint;
    CGPoint lineEndPoint;

    CGFloat lineLayerTopY;
    CGFloat lineLayerBottomY;
    
    
    CGFloat onethirdHight;
    CGFloat quarterWidth;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupDefaultValues];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultValues];
    }
    return self;
}

- (void)setupDefaultValues {
    self.topColor = [UIColor colorWithRed:224/255.0 green:59/255.0 blue:69/255.0 alpha:1];
    self.midColor = [UIColor colorWithRed:24/255.0 green:117/255.0 blue:218/255.0 alpha:1];
    self.bottomColor = [UIColor colorWithRed:29/255.0 green:179/255.0 blue:138/255.0 alpha:1];

    self.backgroundColor = [UIColor clearColor];
    self.lineWith = 7.0f;
}


- (void)drawRect:(CGRect)rect {
    
    onethirdHight = CGRectGetHeight(rect)/3;
    quarterWidth=  CGRectGetWidth(rect)/4;
    
    lineLayerY = onethirdHight*2;
    
    lineStartPoint = CGPointMake(quarterWidth, lineLayerY);
    lineEndPoint = CGPointMake(quarterWidth * 3, lineLayerY);
    
    lineLayerTopY = lineLayerY - onethirdHight/2;
    lineLayerBottomY = lineLayerY + onethirdHight/2;
    
    [self setupCircleLayer];
    [self setupLineLayer];
}


- (void)setupCircleLayer {
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(quarterWidth*2, quarterWidth*2)
                                                              radius:quarterWidth*2 startAngle:0
                                                            endAngle:M_PI*2 clockwise:true];
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.path = circlePath.CGPath;
    self.circleLayer.strokeColor = self.midColor.CGColor;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleLayer.lineWidth = self.lineWith;
    [self.layer addSublayer:self.circleLayer];
}

- (void)setupLineLayer {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:lineStartPoint];
    [path addLineToPoint:lineEndPoint];
    self.lineLayer = [CAShapeLayer layer];
    self.lineLayer.path = path.CGPath;
    self.lineLayer.strokeColor = self.midColor.CGColor;
    self.lineLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:self.lineLayer];
    self.lineLayer.lineWidth = self.lineWith;
    self.lineLayer.lineCap = kCALineCapRound;
    lineLayerCurrentY = lineLayerY;
}



-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint newTouch = [touch locationInView:self];
    CGFloat delta = (newTouch.y - lineLayerCurrentY);
    
    if (delta >2 ) {
        lineLayerCurrentY +=2;
    } else if (delta < -2) {
        lineLayerCurrentY -=2;
    } else {
        lineLayerCurrentY += delta;
    }
    
    
    if (lineLayerCurrentY > lineLayerBottomY) {
        lineLayerCurrentY = lineLayerBottomY;
        return;
    }
    if (lineLayerCurrentY < lineLayerTopY ) {
        lineLayerCurrentY = lineLayerTopY;
        return;
    }

    //Change line curve
    CGFloat x =  CGRectGetWidth(self.frame)/4;
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 2;
    [path moveToPoint:lineStartPoint];
    [path addCurveToPoint:lineEndPoint controlPoint1:CGPointMake(x * 1.5 , lineLayerCurrentY) controlPoint2:CGPointMake(2.5 * x, lineLayerCurrentY)];
    self.lineLayer.path = path.CGPath;
    
    
    //Change color & score
    CGColorRef color = nil;
    CGFloat progress;
    if (lineLayerCurrentY > lineLayerY) {
        progress =  (lineLayerCurrentY - lineLayerY) / (lineLayerBottomY - lineLayerY);
        color = [UIColor fromColor:_midColor toColor:_bottomColor withProgress:progress].CGColor;
        self.score = 0.5 + progress/2;
    } else {
        progress = (lineLayerY - lineLayerCurrentY) / (lineLayerY - lineLayerTopY);
        color = [UIColor fromColor:_midColor toColor:_topColor withProgress:progress].CGColor;
        self.score = 0.5 - progress/2;
    }    
    self.lineLayer.strokeColor = color;
    self.circleLayer.strokeColor = color;
}


@end
