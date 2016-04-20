//
//  SLCharacterDebugTableViewController.m
//  SlotLabel
//
//  Created by David Westerhoff on 4/19/16.
//  Copyright © 2016 David Westerhoff. All rights reserved.
//
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
        [self.slotCharacter setFont:[UIFont fontWithName:@"Courier" size:12]];
    }
    else if (indexPath.row == SLCharacterSettingValueFontSize) {
        [self.slotCharacter setFont:[UIFont fontWithName:@"Courier" size:20]];
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
        [self.slotCharacter setVerticalAlignment:UIControlContentVerticalAlignmentBottom];
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
