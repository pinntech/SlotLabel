//
//  SLCharacterDebugTableViewController.h
//  SlotLabel
//
//  Created by David Westerhoff on 4/19/16.
//  Copyright © 2016 David Westerhoff. All rights reserved.
//

#import <SlotLabel/SlotCharacter.h>
#import <UIKit/UIKit.h>

@interface SLCharacterDebugTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet SlotCharacter* slotCharacter;

@end
