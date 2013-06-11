//
//  UIColor+UIColorCategory.h
//  SampleTabController
//
//  Created by Dhananjay Vidwans on 11/06/13.
//  Copyright (c) 2013 Jenn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UIColorCategory)

+ (UIColor *)colorWithHex:(UInt32)col;
+ (UIColor *)colorWithHexString:(NSString *)str;

@end
