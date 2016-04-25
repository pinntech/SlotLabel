// SLCharacterDebugTableViewController.h
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

#import "SLCharacterDebugTableViewController.h"

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

@implementation SLCharacterDebugTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.slotCharacter.horizontalAlignment = NSTextAlignmentCenter;
    [self animate];
    [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(animate) userInfo:nil repeats:YES];
}

#pragma mark - IBActions

#pragma mark - UITableView
- (void)tableView:(UITableView*)tableView willDisplayCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    cell.tintColor = [UIColor darkGrayColor];
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == SLCharacterSettingValueFont) {
        [self.slotCharacter setFont:[UIFont fontWithName:@"Courier" size:25]];
    }
    else if (indexPath.row == SLCharacterSettingValueFontSize) {
        [self.slotCharacter setFont:[UIFont fontWithName:@"Courier" size:40]];
    }
    else if (indexPath.row == SLCharacterSettingValueTextColor) {
        [self.slotCharacter setTextColor:[UIColor magentaColor]];
    }
    else if (indexPath.row == SLCharacterSettingValueShadowColor) {
        [self.slotCharacter setShadowColor:[UIColor grayColor]];
    }
    else if (indexPath.row == SLCharacterSettingValueShadowOffset) {
        [self.slotCharacter setShadowOffset:CGSizeMake(4, 4)];
    }
    else if (indexPath.row == SLCharacterSettingValueStrokeColor) {
        [self.slotCharacter setStrokeColor:[UIColor purpleColor]];
    }
    else if (indexPath.row == SLCharacterSettingValueStrokeWidth) {
        [self.slotCharacter setStrokeWidth:3];
    }
    else if (indexPath.row == SLCharacterSettingValueAnimationSpeed) {
        [self.slotCharacter setAnimationSpeed:1];
    }
    else if (indexPath.row == SLCharacterSettingValueAnimationColor) {
        [self.slotCharacter setAnimationColor:[UIColor greenColor]];
    }
    else if (indexPath.row == SLCharacterSettingValueVerticalAlignment) {
        [self.slotCharacter setVerticalAlignment:UIControlContentVerticalAlignmentTop];
    }
    else if (indexPath.row == SLCharacterSettingValueHorizontalAlignment) {
        [self.slotCharacter setHorizontalAlignment:NSTextAlignmentLeft];
    }
}

#pragma mark - Animation
- (void)animate
{
    [self.slotCharacter animateToCharacter:'a'];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotCharacter animateToCharacter:'b'];
        NSLog(@"%c", self.slotCharacter.value);
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotCharacter animateToCharacter:'c'];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotCharacter animateToCharacter:'d'];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotCharacter animateToCharacter:'e'];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotCharacter animateToCharacter:'f'];
    });
}

@end
