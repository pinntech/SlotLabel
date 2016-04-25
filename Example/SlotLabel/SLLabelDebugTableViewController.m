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

    self.slotLabel.animationSpeed = 2.5f;
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotLabel animateToString:@"fucker"];
    });
}

- (void)tableView:(UITableView*)tableView
    didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
}

@end
