// SlotLabel.m
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

#import "SlotLabel.h"

@implementation SlotLabel

#pragma mark - Superclass
- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit
{
    self.characters = [[NSMutableArray alloc] init];
    self.font = [UIFont systemFontOfSize:12];
    self.textColor = [UIColor blackColor];
    self.shadowColor = [UIColor grayColor];
    self.shadowOffset = CGSizeMake(0, 0);
    self.strokeColor = [UIColor grayColor];
    self.strokeWidth = 0.0f;
    self.verticalAlignment = UIControlContentVerticalAlignmentBottom;
    self.horizontalAlignment = NSTextAlignmentRight;
    self.animationSpeed = SL_DEFAULT_ANIMATION_SPEED;
    self.animationColor = nil;
}

- (void)prepareForInterfaceBuilder
{
    [self setText:@"hello"];
}

#pragma mark - Public
- (void)animateToString:(NSString*)string
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self sizeToFitString:string];
        for (int i = 0; i < [string length]; i++) {
            char character = [string characterAtIndex:i];
            [self.characters[i] animateToCharacter:character];
        }
        // Clears out the padding characters if any
        for (NSUInteger i = [string length]; i < [self.characters count]; i++) {
            [self.characters[i] animateToCharacter:' '];
        }
    });
}

- (void)setText:(NSString*)string
{
    [self sizeToFitString:string];
    for (int i = 0; i < [string length]; i++) {
        char character = [string characterAtIndex:i];
        [self.characters[i] setToCharacter:character];
    }
    // Clears out the padding characters if any
    for (NSUInteger i = [string length]; i < [self.characters count]; i++) {
        [self.characters[i] setToCharacter:' '];
    }
}

- (void)sizeToFitString:(NSString*)string
{
    // Draw additional SlotCharacters so we can fit the string
    if ([string length] > [self.characters count]) {
        [self removeAllCharacters];
        [self addCharacters:[string length]];
    }
    // Delete additional extraneous SlotCharacters
    else if ([string length] < [self.characters count]) {
    }
}

- (void)removeAllCharacters
{
    for (SlotCharacter* character in self.characters) {
        [character removeFromSuperview];
    }
    [self.characters removeAllObjects];
}

- (NSUInteger)numberOfCharacters
{
    return self.characters.count;
}

- (void)setFont:(UIFont*)font
{
    _font = font;
    for (SlotCharacter* character in self.characters) {
        [character setFont:font];
    }
}

- (void)setTextColor:(UIColor*)textColor
{
    _textColor = textColor;
    for (SlotCharacter* character in self.characters) {
        [character setTextColor:textColor];
    }
}

- (void)setShadowColor:(UIColor*)shadowColor
{
    _shadowColor = shadowColor;
    for (SlotCharacter* character in self.characters) {
        [character setShadowColor:shadowColor];
    }
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
    _shadowOffset = shadowOffset;
    for (SlotCharacter* character in self.characters) {
        [character setShadowOffset:shadowOffset];
    }
}

- (void)setStrokeColor:(UIColor*)strokeColor
{
    _strokeColor = strokeColor;
    for (SlotCharacter* character in self.characters) {
        [character setStrokeColor:strokeColor];
    }
}

- (void)setStrokeWidth:(CGFloat)strokeWidth
{
    _strokeWidth = strokeWidth;
    for (SlotCharacter* character in self.characters) {
        [character setStrokeWidth:strokeWidth];
    }
}

- (void)setAnimationSpeed:(CGFloat)animationSpeed
{
    _animationSpeed = animationSpeed;
    for (SlotCharacter* character in self.characters) {
        [character setAnimationSpeed:animationSpeed];
    }
}

- (void)setAnimationColor:(UIColor*)animationColor
{
    _animationColor = animationColor;
    for (SlotCharacter* character in self.characters) {
        character.animationColor = animationColor;
    }
}

- (void)setVerticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
{
    _verticalAlignment = verticalAlignment;
    for (SlotCharacter* character in self.characters) {
        [character setVerticalAlignment:verticalAlignment];
    }
}

- (void)setHorizontalAlignment:(NSTextAlignment)horizontalAlignment
{
    _horizontalAlignment = horizontalAlignment;
}

#pragma mark - Private
- (void)addCharacter
{
    CGFloat xOrigin = 0;
    if (self.characters.count > 0) {
        SlotCharacter* lastCharacter = [self.characters lastObject];
        xOrigin = lastCharacter.frame.origin.x;
    }
    NSLog(@"%lu", (long)self.characters.count);
    NSLog(@"x origin: %f", xOrigin);

    // Determine label intrinsic size
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label.font = self.font;
    label.text = @"W";

    CGRect frame = CGRectMake(label.intrinsicContentSize.width * self.characters.count, 0, label.intrinsicContentSize.width, self.frame.size.height);
    SlotCharacter* character = [[SlotCharacter alloc] initWithFrame:frame];
    [character sizeToFit];
    [self skinCharacter:character];
    [character setToCharacter:' '];
    [self.characters addObject:character];
    [self addSubview:character];
}

- (void)addCharacters:(NSInteger)amount
{
    for (int i = 0; i < amount; i++) {
        //        [self addCharacter];
        if (self.characters.count > 0) {
            SlotCharacter* lastCharacter = [self.characters lastObject];
            NSLog(@"%f", lastCharacter.frame.origin.x);
        }
        // Determine label intrinsic size
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        label.font = self.font;
        label.text = @"W";

        CGRect frame = CGRectMake(label.intrinsicContentSize.width * i, 0, label.intrinsicContentSize.width, self.frame.size.height);
        SlotCharacter* character = [[SlotCharacter alloc] initWithFrame:frame];
        if (i % 2 == 0) {
            [character setBackgroundColor:[UIColor lightGrayColor]];
        }
        [character sizeToFit];
        [self skinCharacter:character];
        [character setToCharacter:' '];
        [self.characters addObject:character];
        [self addSubview:character];
    }
}

- (void)skinCharacter:(SlotCharacter*)character
{
    [character setFont:self.font];
    [character setTextColor:self.textColor];
    [character setShadowColor:self.shadowColor];
    [character setShadowOffset:self.shadowOffset];
    [character setStrokeColor:self.strokeColor];
    [character setStrokeWidth:self.strokeWidth];
    [character setAnimationColor:self.animationColor];
    [character setAnimationSpeed:self.animationSpeed];
    [character setVerticalAlignment:self.verticalAlignment];
}

@end
