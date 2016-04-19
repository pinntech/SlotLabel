// SlotCharacter.h
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

#import <UIKit/UIKit.h>

IB_DESIGNABLE
/**
 *  This class vertically lays out UILabels in the scroll view, it manages the 
 *  logic of calculating the offset to display the ASCII character value.
 */
@interface SlotCharacter : UIScrollView

/**
*  A container for the vertically organized array of UILabels
*/
@property (nonatomic, strong) NSMutableArray<UILabel*>* labels;

/**
 *  The character that is current set returned as an ASCII character
 */
@property (nonatomic, assign) unsigned char value;

/**
 *  The font of the labels in the superview
 */
@property (nonatomic, strong) UIFont* font;

/**
 *  The font of the labels in the superview
 */
@property (nonatomic, assign) IBInspectable NSUInteger fontSize;

/**
 *  The color of the labels while not in animation
 */
@property (nonatomic, strong) IBInspectable UIColor* textColor;

/**
 *  The shadow color of the labels within
 */
@property (nonatomic, strong) IBInspectable UIColor* shadowColor;

/**
 *  The shadow offset of the labels within the superview frame
 */
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;

/**
 *  The color of the stroke on the labels
 */
@property (nonatomic, strong) IBInspectable UIColor* strokeColor;

/**
 *  The width of the stroke on the labels
 */
@property (nonatomic, assign) IBInspectable CGFloat strokeWidth;

/**
 *  The speed of the animation, which is the time in seconds the label will 
 *  animate over, so the higher this number the slower the animation. 
 *  Defaults to 0.5 seconds.
 */
@property (nonatomic, assign) IBInspectable CGFloat animationSpeed;

/**
 *  The color of the labels while in animation
 */
@property (nonatomic, strong) IBInspectable UIColor* animationColor;

/**
 *  Sets the vertical alignment of the labels within the superview frame
 */
@property (nonatomic, assign) UIControlContentVerticalAlignment verticalAlignment;

/**
 *  Sets the horizontal alignment of the labels within the superview frame
 */
@property (nonatomic, assign) NSTextAlignment horizontalAlignment;

/**
 *  Animates the label to a specific ASCII character.
 *
 *  @param character An ASCII character to animate to
 */
- (void)animateToCharacter:(unsigned char)character;

/**
 *  Animates the label to a ASCII character, with a completion block to be ran 
 *  at the end of the animation.
 *
 *  @param character  An ASCII character to animate to
 *  @param completion Completion block to be ran at the end of animation
 */
- (void)animateToCharacter:(unsigned char)character
                completion:(void (^)(void))completion;

/**
 *  Animates the label to a ASCII character, with a completion block to be ran 
 *  at the end of the animation. The duration is the number of seconds to 
 *  animate over.
 *
 *  @param character  An ASCII character to animate to
 *  @param duration   Duration to animate over, higher is slower
 *  @param completion Completion block to be ran at the end of animation
 */
- (void)animateToCharacter:(unsigned char)character
                  duration:(CGFloat)duration
                completion:(void (^)(void))completion;

/**
 *  Sets the label to a specific ASCII character.
 *
 *  @param character An ASCII character to set to
 */
- (void)setToCharacter:(unsigned char)character;

/**
 *  Returns YES if the SlotCharacter is currently animating
 *
 *  @return A boolean value returning YES if the view is animating
 */
- (BOOL)isAnimating;

@end