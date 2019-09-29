// SlotLabel.h
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

#import "SlotCharacter.h"
#import <UIKit/UIKit.h>

IB_DESIGNABLE
/**
 *  The label itself is made up of horizontally organized characters that can be
 *  each, individually manipulated for granular control. The main logic for 
 *  calcuating the offsets are done at the character level, this class however 
 *  deals with parsing and and mapping out the assignment from a string.
 */
@interface SlotLabel : UIView

/**
*  A logical array of the horizontally aligned characters from left to right.
*/
@property (nonatomic, strong) NSMutableArray* characters;

/**
 *  The text set within the label
 */
@property (nonatomic, strong) IBInspectable NSString* text;

/**
 *  The font of the label
 */
@property (nonatomic, strong) IBInspectable UIFont* font;

/**
*  The offset width of the label
*/
@property (nonatomic, assign) IBInspectable CGFloat offsetWidth;

/**
 *  The text color of the label
 */
@property (nonatomic, strong) IBInspectable UIColor* textColor;

/**
*  The text color of the slot background
*/
@property (nonatomic, strong) IBInspectable UIColor* slotBackgroundColor;

/**
 *  The shadow color of the label
 */
@property (nonatomic, strong) IBInspectable UIColor* shadowColor;

/**
 *  The shadow offset of the label
 */
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;

/**
 *  The stroke color of the label
 */
@property (nonatomic, strong) IBInspectable UIColor* strokeColor;

/**
 *  The width of the stroke on the label
 */
@property (nonatomic, assign) IBInspectable CGFloat strokeWidth;

/**
 *  The color of the label while in animation
 */
@property (nonatomic, strong) IBInspectable UIColor* animationColor;

/**
 *  The speed of the animation, which is the time in seconds the label will 
 *  animate over, so the higher this number the slower the animation. 
 *  Defaults to 0.5 seconds.
 */
@property (nonatomic, assign) IBInspectable CGFloat animationSpeed;

/**
 *  The vertical alignment of the label
 */
@property (nonatomic, assign) UIControlContentVerticalAlignment verticalAlignment;

/**
 *  The horizontal alignment of the label within its frame
 */
@property (nonatomic, assign) NSTextAlignment horizontalAlignment;

/**
 *  Sets the label to the given string with animation.
 *
 *  @param string Text to animate the label to
 */
- (void)animateToString:(NSString*)string;

@end
