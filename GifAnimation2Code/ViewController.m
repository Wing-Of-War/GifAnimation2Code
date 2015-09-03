//
//  ViewController.m
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/8/25.
//  Copyright (c) 2015年 Nomemo. All rights reserved.
//

#import "ViewController.h"
#import "MovingValueProgressBar.h"
#import "FaceComment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    MovingValueProgressBar *progressBar = [[MovingValueProgressBar alloc]init];
//    progressBar.center = self.view.center;
//    [self.view addSubview:progressBar];
//    [progressBar start];
    
    
    FaceComment *face = [[FaceComment alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
    [self.view addSubview:face];
    face.center = self.view.center;
    
    [face addObserver:self forKeyPath:@"score" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"object %@, change %@", object, change);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
