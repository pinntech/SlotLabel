// SLLabelDebugTableViewController.m
// Copyright (c) 2016 Pinn Technologies, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SLLabelDebugTableViewController.h"

typedef NS_ENUM(NSUInteger, SLCharacterSettingValue) {
    SLCharacterSettingValueFont,
    SLCharacterSettingValueFontSize,
    SLCharacterSettingValueTextColor,
    SLCharacterSettingValueShadowColor,
    SLCharacterSettingValueShadowOffset,
    SLCharacterSettingValueStrokeColor,
    SLCharacterSettingValueStrokeWidth,
    SLCharacterSettingValueAnimationSpeed,
    SLCharacterSettingValueAnimationColor,
    SLCharacterSettingValueVerticalAlignment,
    SLCharacterSettingValueHorizontalAlignment
};

@interface SLLabelDebugTableViewController ()
@end

@implementation SLLabelDebugTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.slotLabel setAnimationSpeed:2.0f];
    [NSTimer scheduledTimerWithTimeInterval:6.0 target:self selector:@selector(animate) userInfo:nil repeats:YES];
    [self animate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animate
{
    [self.slotLabel animateToString:@"hello"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotLabel animateToString:@"world"];
    });
}

- (void)tableView:(UITableView*)tableView
    didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row == SLCharacterSettingValueFont) {
        [self.slotLabel setFont:[UIFont fontWithName:@"Courier" size:25]];
    }
    else if (indexPath.row == SLCharacterSettingValueFontSize) {
        [self.slotLabel setFont:[UIFont fontWithName:@"Courier" size:40]];
    }
    else if (indexPath.row == SLCharacterSettingValueTextColor) {
        [self.slotLabel setTextColor:[UIColor magentaColor]];
    }
    else if (indexPath.row == SLCharacterSettingValueShadowColor) {
        [self.slotLabel setShadowColor:[UIColor grayColor]];
    }
    else if (indexPath.row == SLCharacterSettingValueShadowOffset) {
        [self.slotLabel setShadowOffset:CGSizeMake(4, 4)];
    }
    else if (indexPath.row == SLCharacterSettingValueStrokeColor) {
        [self.slotLabel setStrokeColor:[UIColor purpleColor]];
    }
    else if (indexPath.row == SLCharacterSettingValueStrokeWidth) {
        [self.slotLabel setStrokeWidth:3];
    }
    else if (indexPath.row == SLCharacterSettingValueAnimationSpeed) {
        [self.slotLabel setAnimationSpeed:1];
    }
    else if (indexPath.row == SLCharacterSettingValueAnimationColor) {
        [self.slotLabel setAnimationColor:[UIColor greenColor]];
    }
    else if (indexPath.row == SLCharacterSettingValueVerticalAlignment) {
        [self.slotLabel setVerticalAlignment:UIControlContentVerticalAlignmentTop];
    }
    else if (indexPath.row == SLCharacterSettingValueHorizontalAlignment) {
        [self.slotLabel setHorizontalAlignment:NSTextAlignmentLeft];
    }
}

@end
