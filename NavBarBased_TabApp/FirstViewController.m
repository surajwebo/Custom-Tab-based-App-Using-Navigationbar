//
//  FirstViewController.m
//  NavBarBased_TabApp
//
//  Created by Dhananjay Vidwans on 11/06/13.
//  Copyright (c) 2013 suraj. All rights reserved.
//

#import "FirstViewController.h"

UIView *bottomBar;
UIButton *btn1;
UIButton *btn2;
UIButton *btn3;
UIButton *btn4;
UIButton *btn5;

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"First";
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    bottomBar.hidden = NO;
    btn4.hidden = YES;
    [btn1 removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [btn1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [btn5 setHidden:NO];
    [btn5 removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [btn5 addTarget:self action:@selector(popScreens) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonAction {
    [[[UIAlertView alloc] initWithTitle:@"Tab 1 Button pressed" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

-(void)popScreens {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

@end
