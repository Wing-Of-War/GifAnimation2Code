//
//  WidgetListViewController.m
//  GifAnimation2Code
//
//  Created by JUE DUKE on 15/9/3.
//  Copyright © 2015年 Nomemo. All rights reserved.
//

#import "WidgetListViewController.h"




@interface WidgetListViewController()

@property (nonatomic, strong) NSArray *widgets;

@end

@implementation WidgetListViewController


- (void)viewDidLoad {
    self.widgets = @[@"ProgressBar",
                     @"FaceComment",
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
    cell.textLabel.text = self.widgets[indexPath.row];
    return cell;
}



@end
