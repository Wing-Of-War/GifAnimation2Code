//
//  WOWMatrixMenu.m
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/9/4.
//  Copyright © 2015年 Nomemo. All rights reserved.
//

#import "WOWMatrixMenu.h"

@interface WOWMatrixMenu ()

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, strong) CATextLayer *normalTextLayer;
@property (nonatomic, strong) CATextLayer *selectedTextLayer;

@property (nonatomic, strong) NSArray *squreLayers;

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectedColor;


@property (nonatomic, strong) CAShapeLayer *contentLayer;
@property (nonatomic, strong) CAShapeLayer *fadeLayer;
@end

@implementation WOWMatrixMenu

- (void)action {

    

    if (self.selected) {
        [self.contentLayer setAffineTransform:CGAffineTransformMakeRotation(0)];
        [self.fadeLayer setAffineTransform:CGAffineTransformMakeRotation(0)];
        self.fadeLayer.opacity = 1;
        
        self.fadeLayer.fillColor = self.normalColor.CGColor;
        self.contentLayer.fillColor = self.normalColor.CGColor;

        
        self.normalTextLayer.opacity = 1;
        self.selectedTextLayer.opacity = 0;
        [self.normalTextLayer setAffineTransform:CGAffineTransformMakeRotation(0)];
        [self.selectedTextLayer setAffineTransform:CGAffineTransformMakeRotation(-M_PI_4)];

    } else {
        [self.contentLayer setAffineTransform:CGAffineTransformMakeRotation(M_PI_4)];
        [self.fadeLayer setAffineTransform:CGAffineTransformMakeRotation(M_PI_4)];
        self.fadeLayer.opacity = 0;
        
        self.fadeLayer.fillColor = self.selectedColor.CGColor;
        self.contentLayer.fillColor = self.selectedColor.CGColor;
        
        
        self.normalTextLayer.opacity = 0;
        self.selectedTextLayer.opacity = 1;

        [self.normalTextLayer setAffineTransform:CGAffineTransformMakeRotation(M_PI_4)];
        [self.selectedTextLayer setAffineTransform:CGAffineTransformMakeRotation(0)];

    }
    self.selected = !self.selected;


}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        self.backgroundColor = [UIColor lightGrayColor];
        self.frame = CGRectMake(0, 0, 60, 60);
        self.normalColor = [UIColor colorWithRed:83/255.0 green:94/255.0 blue:102/255.0 alpha:1];
        self.selectedColor = [UIColor colorWithRed:0/255.0 green:84/255.0 blue:162/255.0 alpha:1];
        self.selected = false;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    CGFloat buttonWidth = CGRectGetHeight(rect);
    CGFloat squreSideLength = buttonWidth/4;
    CGFloat squrePadding = squreSideLength/2;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.bounds = CGRectMake(buttonWidth/2,buttonWidth/2, buttonWidth, buttonWidth);
    

    CGMutablePathRef path = CGPathCreateMutable();
    CGAffineTransform transform = CGAffineTransformMakeTranslation(buttonWidth/2, buttonWidth/2);
    
    CGPathAddRect(path, &transform, CGRectMake(squreSideLength + squrePadding, 0, squreSideLength, squreSideLength));  //2
    CGPathAddRect(path, &transform, CGRectMake(0, squreSideLength+squrePadding, squreSideLength, squreSideLength));    //4
    CGPathAddRect(path, &transform, CGRectMake(squreSideLength + squrePadding, squreSideLength+squrePadding, squreSideLength, squreSideLength));//5
    CGPathAddRect(path, &transform, CGRectMake(squreSideLength * 2 + squrePadding*2, squreSideLength+squrePadding, squreSideLength, squreSideLength));//6

    CGPathAddRect(path, &transform, CGRectMake(squreSideLength + squrePadding, squreSideLength * 2 + squrePadding*2, squreSideLength, squreSideLength));//8

    shapeLayer.path = path;
    shapeLayer.fillColor = self.normalColor.CGColor;
    
    
    
    
    CAShapeLayer *fadeLayer = [CAShapeLayer layer];
    fadeLayer.bounds = CGRectMake(buttonWidth/2,buttonWidth/2, buttonWidth, buttonWidth);

    path = CGPathCreateMutable();
    CGPathAddRect(path, &transform, CGRectMake(0, 0, squreSideLength, squreSideLength));    //1
    CGPathAddRect(path, &transform, CGRectMake(squreSideLength * 2 + squrePadding*2, 0, squreSideLength, squreSideLength)); //3
    CGPathAddRect(path, &transform, CGRectMake(0, squreSideLength * 2 + squrePadding*2, squreSideLength, squreSideLength)); //7
    CGPathAddRect(path, &transform, CGRectMake(squreSideLength * 2 + squrePadding*2, squreSideLength * 2 + squrePadding*2, squreSideLength, squreSideLength));  //9
    fadeLayer.path = path;
    fadeLayer.fillColor = self.normalColor.CGColor;


    //Set position.
    CGPoint subLayerPosition = CGPointMake(buttonWidth/2, buttonWidth/2);
    self.fadeLayer = fadeLayer;
    self.contentLayer = shapeLayer;
    shapeLayer.position = subLayerPosition;
    fadeLayer.position = subLayerPosition;
    [self.layer addSublayer:shapeLayer];
    [self.layer addSublayer:fadeLayer];
    
    
    
    
    
    UIFont *font = [UIFont boldSystemFontOfSize:squreSideLength];
    //set layer font
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);

    
    self.normalTextLayer = [CATextLayer layer];
    self.normalTextLayer.anchorPoint = CGPointMake(2.0, 0.5);
    self.normalTextLayer.frame = CGRectMake(-buttonWidth, buttonWidth/2 - squrePadding, buttonWidth, squreSideLength);
    self.normalTextLayer.string = @"MENU";
    self.normalTextLayer.font = fontRef;
    self.normalTextLayer.fontSize = font.pointSize;
    self.normalTextLayer.foregroundColor = self.normalColor.CGColor;
    self.normalTextLayer.contentsScale = [UIScreen mainScreen].scale;

    [self.layer addSublayer:self.normalTextLayer];
    
    
    
    
    self.selectedTextLayer = [CATextLayer layer];
    self.selectedTextLayer.anchorPoint = CGPointMake(2.0, 0.5);
    self.selectedTextLayer.frame = CGRectMake(-buttonWidth, buttonWidth/2 - squrePadding, buttonWidth, squreSideLength);
    self.selectedTextLayer.font = fontRef;
    self.selectedTextLayer.fontSize = font.pointSize;
    self.selectedTextLayer.foregroundColor = self.normalColor.CGColor;
    self.selectedTextLayer.contentsScale = [UIScreen mainScreen].scale;
    self.selectedTextLayer.opacity = 0;
    [self.selectedTextLayer setAffineTransform:CGAffineTransformMakeRotation(-M_PI_4)];
    
    self.selectedTextLayer.string = @"CLOSE";
    [self.layer addSublayer:self.selectedTextLayer];

    
}


@end
