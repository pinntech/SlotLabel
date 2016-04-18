//
//  SlotViewController.m
//  SlotLabel
//
//  Created by David Westerhoff on 03/14/2016.
//  Copyright (c) 2016 David Westerhoff. All rights reserved.
//

#import "SLViewController.h"
#import <SlotLabel/SlotLabel.h>

@interface SLViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet SlotCharacter* slotCharacter;
@property (weak, nonatomic) IBOutlet UITextField* textField;

@end

@implementation SLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    self.textField.delegate = self;
    [self.textField becomeFirstResponder];

    [self.slotCharacter animateToCharacter:'a'];
    [self.slotCharacter setAnimationColor:[UIColor purpleColor]];
    [self.slotCharacter setTextColor:[UIColor whiteColor]];
    [self.slotCharacter setBackgroundColor:[UIColor yellowColor]];
    [self.slotCharacter setVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.slotCharacter setHorizontalAlignment:NSTextAlignmentCenter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegate Methods
- (BOOL)textField:(UITextField*)textField
    shouldChangeCharactersInRange:(NSRange)range
                replacementString:(NSString*)string
{
    [self.slotCharacter animateToCharacter:[string characterAtIndex:0]];
    return NO;
}

@end
