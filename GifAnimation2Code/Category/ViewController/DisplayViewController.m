//
//  ContentViewController.m
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/9/3.
//  Copyright © 2015年 Nomemo. All rights reserved.
//

#import "DisplayViewController.h"
#import "WOWFaceComment.h"
#import "WOWProgressBar.h"
#import "WOWMatrixMenu.h"

@interface DisplayViewController()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@end

@implementation DisplayViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.type = WidgetType_MatrixMenu;
    switch (self.type) {
        case WidgetType_ProgressBar :
            [self setupProgressBar];
            break;
        case WidgetType_CommentFace:
            [self setupCommentFace];
            break;

        case WidgetType_MatrixMenu:
            [self setupMatrixMenu];
            break;
    }

}

- (void)setupProgressBar {
    WOWProgressBar *progressBar = [[WOWProgressBar alloc]init];
    [self.view addSubview:progressBar];
    progressBar.center = self.view.center;
    [progressBar performSelector:@selector(start) withObject:nil afterDelay:0.25];
}

- (void)setupCommentFace {
//    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://38.media.tumblr.com/69dad0a5ffd5ba72aacc89e67f5d9d75/tumblr_ntn2cbsDEC1stn28do1_1280.gif"]];
//    [self.gifWebView loadRequest:request];
    

    WOWFaceComment *commentFace = [[WOWFaceComment alloc]initWithFrame:CGRectMake(00, 0, 260, 260)];
    [self.view addSubview:commentFace];
    commentFace.center = self.view.center;
        self.tipLabel.text = @"Drag up and down to rate";
}

- (void)setupMatrixMenu {
//    http://smashinghub.com/wp-content/uploads/2014/09/menu-animation-effects-5.gif
    
    WOWMatrixMenu *menu = [[WOWMatrixMenu alloc]init];
    [self.view addSubview:menu];
    menu.center = self.view.center;
    
    self.tipLabel.text = @"Tap";

}

@end
