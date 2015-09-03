//
//  WidgetListViewController.m
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/9/3.
//  Copyright © 2015年 Nomemo. All rights reserved.
//

#import "WidgetListViewController.h"
#import "DisplayViewController.h"
#import "Enums.h"


@interface WidgetListViewController()

@property (nonatomic, strong) NSArray *widgets;
@property (nonatomic, strong) NSIndexPath *selectIndex;
@end

@implementation WidgetListViewController


- (void)viewDidLoad {
    
    
    self.widgets = @[@[@"ProgressBar",@(WidgetType_ProgressBar)],
                     @[@"FaceComment",@(WidgetType_CommentFace)],
                     @[@"MatrixMenu",@(WidgetType_MatrixMenu)],
                     ];
    
    self.title = @"Gif2Code-Widget";

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.widgets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.widgets[indexPath.row] firstObject];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    self.selectIndex = indexPath;
    [self performSegueWithIdentifier:@"showDisplayView" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *index = sender;
    DisplayViewController *destViewCont = segue.destinationViewController;
    destViewCont.type = [[self.widgets[index.row] lastObject] integerValue];
}

@end
