//
//  ViewController.m
//  NavBarBased_TabApp
//
//  Created by Dhananjay Vidwans on 11/06/13.
//  Copyright (c) 2013 suraj. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+UIColorCategory.h"

UIView *bottomBar;
UIButton *btn1;
UIButton *btn2;
UIButton *btn3;
UIButton *btn4;
UIButton *btn5;
BOOL isTabViewSlided;
UIButton *tabSliderBtn;

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Root";
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
//    UIColor *color1 = [UIColor colorWithHex:0xFF0000];
    UIColor *color2 = [UIColor colorWithHexString:@"#779438"]; //#54544b
    [self.view setBackgroundColor:color2];
    
    bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height+5, 1024, 58)];
    bottomBar.backgroundColor = [UIColor clearColor];
    [bottomBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bottom-bar.png"]]];
    [self.navigationController.view addSubview:bottomBar];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setFrame:CGRectMake(0, 15, 100, 42)];
    [btn1 setTitle:@"Tab 1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setFrame:CGRectMake(120, 15, 100, 42)];
    [btn2 setTitle:@"Tab 2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setFrame:CGRectMake(240, 15, 100, 42)];
    [btn3 setTitle:@"Tab 3" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4 setFrame:CGRectMake(360, 15, 100, 42)];
    [btn4 setTitle:@"Tab 4" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn5 setFrame:CGRectMake(self.view.bounds.size.width-100, 15, 100, 42)];
    [btn5 setTitle:@"HOME" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    tabSliderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tabSliderBtn setFrame:CGRectMake(0, 0, 1024, 14)];
    [tabSliderBtn setTitle:@"^" forState:UIControlStateNormal];
    [tabSliderBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [tabSliderBtn setBackgroundColor:[UIColor clearColor]];
    [tabSliderBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [tabSliderBtn.layer setBorderWidth:1.0f];
    
    [self enhanceUI :btn1 :[UIColor lightGrayColor] :[UIColor purpleColor]];
    [self enhanceUI :btn2 :[UIColor lightGrayColor] :[UIColor yellowColor]];
    [self enhanceUI :btn3 :[UIColor lightGrayColor] :[UIColor orangeColor]];
    [self enhanceUI :btn4 :[UIColor lightGrayColor] :[UIColor brownColor]];
    [self enhanceUI :btn5 :[UIColor lightGrayColor] :[UIColor cyanColor]];
    
    [btn1 setTag:1];
    [btn2 setTag:2];
    [btn3 setTag:3];
    [btn4 setTag:4];
    [btn5 setTag:5];
    [tabSliderBtn setTag:6];
    
    [bottomBar addSubview:btn1];
    [bottomBar addSubview:btn2];
    [bottomBar addSubview:btn3];
    [bottomBar addSubview:btn4];
    [bottomBar addSubview:btn5];
    [bottomBar addSubview:tabSliderBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)navigateToNextScreen:(id)sender {
    FirstViewController *firstViewController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:firstViewController animated:NO];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
//    bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-38, 1024, 58)];
    [tabSliderBtn removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [tabSliderBtn addTarget:self action:@selector(tabSliderBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn4 setHidden:NO];
    [btn5 setHidden:YES];
    
    [btn1 removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [btn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonAction: (id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 1: {
            [self navigateToNextScreen:nil];
        }
            break;
        case 2:
        case 3:
        case 4: {
            [[[UIAlertView alloc] initWithTitle:@"Tab Button pressed" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        }
            break;
            
        default:
            break;
    }
    
}

-(void)enhanceUI:(UIButton *)button :(UIColor *)color1 :(UIColor *)color2 {
    CAGradientLayer *layer1 = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)color1.CGColor,
                       (id)color2.CGColor,
                       nil];
    [layer1 setColors:colors];
    [layer1 setFrame:button.bounds];
    [button.layer insertSublayer:layer1 atIndex:0];
    button.clipsToBounds = YES;
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
    [button.layer setBorderColor:[UIColor blackColor].CGColor];
    [button.layer setBorderWidth:2.0f];
    [button.layer setShadowColor:[UIColor whiteColor].CGColor];
    [button.layer setShadowOpacity:0.8];
    [button.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    [button.layer setCornerRadius:5.0];
    
    [button setTintColor:[UIColor lightGrayColor]];
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
    [tabSliderBtn setTitle:@"v" forState:UIControlStateNormal];
    [UIView commitAnimations];
    isTabViewSlided = YES;
}

-(void)collapseMenu
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [bottomBar setFrame:CGRectMake(bottomBar.bounds.origin.x, self.view.bounds.size.height+5,bottomBar.bounds.size.width,bottomBar.bounds.size.height)];
    [tabSliderBtn setTitle:@"^" forState:UIControlStateNormal];
    [UIView commitAnimations];
    isTabViewSlided = NO;
}

@end
