//
//  SLBasicDemoViewController.m
//  SlotLabel
//
//  Created by David Westerhoff on 4/19/16.
//  Copyright © 2016 David Westerhoff. All rights reserved.
//

#import "SLBasicDemoViewController.h"

@implementation SLBasicDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self animate];
    [NSTimer scheduledTimerWithTimeInterval:9
                                     target:self
                                   selector:@selector(animate)
                                   userInfo:nil
                                    repeats:YES];
    [self.slotLabel setNumberOfCharacters:9];
    // Do this stuff after the character amount is set
    self.slotLabel.animationSpeed = 1.5f;
    [self.slotLabel setFont:[UIFont fontWithName:@"Courier" size:25]];
}

- (void)animate
{
    [self.slotLabel animateToString:@"slot"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotLabel animateToString:@"label"];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotLabel animateToString:@"animate"];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.slotLabel animateToString:@"anything"];
    });
}

@end
