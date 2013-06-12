//
//  FirstViewController.m
//  NavBarBased_TabApp
//
//  Created by Dhananjay Vidwans on 11/06/13.
//  Copyright (c) 2013 suraj. All rights reserved.
//

#import "FirstViewController.h"
#import "UIColor+UIColorCategory.h"

UIView *bottomBar;
UIButton *btn1;
UIButton *btn2;
UIButton *btn3;
UIButton *btn4;
UIButton *btn5;
BOOL isTabViewSlided;
UIButton *tabSliderBtn;

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"First";
//    UIColor *color1 = [UIColor colorWithHex:0xFF0000];
    UIColor *color2 = [UIColor colorWithHexString:@"#bab9a9"]; //#54544b
    [self.view setBackgroundColor:color2];
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
    
    [tabSliderBtn removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [tabSliderBtn addTarget:self action:@selector(tabSliderBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonAction {
    [[[UIAlertView alloc] initWithTitle:@"Tab 1 Button pressed" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

-(void)popScreens {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (IBAction)tabSliderBtnAction:(id)sender {
    if (isTabViewSlided)
        [self collapseMenu];
    else
        [self expandMenu];
}
-(void)expandMenu
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [bottomBar setFrame:CGRectMake(bottomBar.bounds.origin.x, self.view.bounds.size.height-38,bottomBar.bounds.size.width,bottomBar.bounds.size.height)];
    [tabSliderBtn setTitle:@"^" forState:UIControlStateNormal];
    [UIView commitAnimations];
    isTabViewSlided = YES;
}

-(void)collapseMenu
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [bottomBar setFrame:CGRectMake(bottomBar.bounds.origin.x, self.view.bounds.size.height+5,bottomBar.bounds.size.width,bottomBar.bounds.size.height)];
    [tabSliderBtn setTitle:@"V" forState:UIControlStateNormal];
    [UIView commitAnimations];
    isTabViewSlided = NO;
}

@end
