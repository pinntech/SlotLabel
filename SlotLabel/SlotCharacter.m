// SlotCharacter.m
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

#import "SLVerticallyAlignedLabel.h"
#import "SlotCharacter.h"

@implementation SlotCharacter {
    // Maps the character value to an index in the ordered character set
    NSDictionary* characterMap;

    // Contiguous set of stringified character values
    NSOrderedSet* orderedCharacterSet;

    // Count of animations - incremented on queuing, decrementing on completion
    NSUInteger animationsCount;
}

#pragma mark - Superclass
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit
{
    // Init labels container
    self.labels = [[NSMutableArray alloc] init];

    // Enables compatibility with the storyboard contraints
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    // Disable user interaction and indicators
    self.userInteractionEnabled = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;

    // Default label characteristics
    self.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    self.textColor = [UIColor blackColor];
    self.shadowColor = [UIColor grayColor];
    self.shadowOffset = CGSizeMake(0, 0);
    self.strokeColor = [UIColor grayColor];
    self.strokeWidth = 0.0f;
    self.verticalAlignment = UIControlContentVerticalAlignmentBottom;

    // Default animation characteristics
    self.animationSpeed = SL_DEFAULT_ANIMATION_SPEED;
    self.animationColor = nil;

    // Add labels and initialize the character map and animation count
    characterMap = [self characterMap];
    orderedCharacterSet = [self orderedCharacterSet];
    animationsCount = 0;
    [self addLabels];
}

- (void)prepareForInterfaceBuilder
{
    [self addLabels];
    [self setToCharacter:'a'];
}

#pragma mark - Public
#pragma mark - Setting and Animating Content
- (void)animateToCharacter:(unsigned char)character
{
    [self animateToCharacter:character
                  completion:nil];
}

- (void)animateToCharacter:(unsigned char)character
                completion:(void (^)(void))completion
{
    [self animateToCharacter:character
                    duration:self.animationSpeed
                  completion:completion];
}

- (void)animateToCharacter:(unsigned char)character
                  duration:(CGFloat)duration
                completion:(void (^)(void))completion
{
    self.value = character;
    NSString* string = [NSString stringWithFormat:@"%c", character];
    if (![orderedCharacterSet containsObject:string]) {
        [NSException raise:@"NSRangeException" format:@"Character must be a ASCII letter, number or punctuation character"];
    }
    NSInteger index = [self indexOfCharacter:string];
    [self animateToIndex:index
                duration:duration
              completion:completion];
}

- (void)setToCharacter:(unsigned char)character
{
    self.value = character;
    NSString* string
        = [NSString stringWithFormat:@"%c", character];
    if (![orderedCharacterSet containsObject:string]) {
        [NSException raise:@"NSRangeException" format:@"Character must be a ASCII letter, number or punctuation character"];
    }

    NSInteger index = [self indexOfCharacter:string];
    [self setToIndex:index];
}

#pragma mark - Font
- (void)setFont:(UIFont*)font
{
    _font = font;
    [self setLabelsFont:font];
}

#pragma mark - Text Color
- (void)setTextColor:(UIColor*)textColor
{
    _textColor = textColor;
    [self setLabelsTextColor:textColor];
}

#pragma mark - Shadow Color
- (void)setShadowColor:(UIColor*)shadowColor
{
    _shadowColor = shadowColor;
    [self setLabelsShadowColor:shadowColor];
}

#pragma mark - Shadow Offset
- (void)setShadowOffset:(CGSize)shadowOffset
{
    _shadowOffset = shadowOffset;
    [self setLabelsShadowOffset:shadowOffset];
}

#pragma mark - Stroke Color
- (void)setStrokeColor:(UIColor*)strokeColor
{
    _strokeColor = strokeColor;
    [self setLabelsStrokeColor:strokeColor];
}

#pragma mark - Stroke Width
- (void)setStrokeWidth:(CGFloat)strokeWidth
{
    _strokeWidth = strokeWidth;
    [self setLabelsStrokeWidth:strokeWidth];
}

#pragma mark - Vertical Alignment
- (void)setVerticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
{
    _verticalAlignment = verticalAlignment;
    [self setLabelsVerticalAlignment:verticalAlignment];
}

#pragma mark - Private
- (NSDictionary*)characterMap
{
    return @{
        // Space character
        @" " : @0,

        // Numbers
        @"9" : @1,
        @"8" : @2,
        @"7" : @3,
        @"6" : @4,
        @"5" : @5,
        @"4" : @6,
        @"3" : @7,
        @"2" : @8,
        @"1" : @9,
        @"0" : @10,

        // Uppercase characters
        @"Z" : @11,
        @"Y" : @12,
        @"X" : @13,
        @"W" : @14,
        @"V" : @15,
        @"U" : @16,
        @"T" : @17,
        @"S" : @18,
        @"R" : @19,
        @"Q" : @20,
        @"P" : @21,
        @"O" : @22,
        @"N" : @23,
        @"M" : @24,
        @"L" : @25,
        @"K" : @26,
        @"J" : @27,
        @"I" : @28,
        @"H" : @29,
        @"G" : @30,
        @"F" : @31,
        @"E" : @32,
        @"D" : @33,
        @"C" : @34,
        @"B" : @35,
        @"A" : @36,

        // Lowercase characters
        @"z" : @37,
        @"y" : @38,
        @"x" : @39,
        @"w" : @40,
        @"v" : @41,
        @"u" : @42,
        @"t" : @43,
        @"s" : @44,
        @"r" : @45,
        @"q" : @46,
        @"p" : @47,
        @"o" : @48,
        @"n" : @49,
        @"m" : @50,
        @"l" : @51,
        @"k" : @52,
        @"j" : @53,
        @"i" : @54,
        @"h" : @55,
        @"g" : @56,
        @"f" : @57,
        @"e" : @58,
        @"d" : @59,
        @"c" : @60,
        @"b" : @61,
        @"a" : @62,

        // Empty character
        @"" : @63,

        // Punctuation
        @"!" : @64,
        @"\"" : @65,
        @"#" : @66,
        @"$" : @67,
        @"%" : @68,
        @"&" : @69,
        @"'" : @70,
        @"(" : @71,
        @")" : @72,
        @"*" : @73,
        @"+" : @74,
        @"," : @75,
        @"-" : @76,
        @"." : @77,
        @"/" : @78,
        @":" : @79,
        @";" : @80,
        @"<" : @81,
        @"=" : @82,
        @">" : @83,
        @"?" : @84,
        @"@" : @85,
        @"[" : @86,
        @"\\" : @87,
        @"]" : @88,
        @"^" : @89,
        @"_" : @90,
        @"`" : @91,
        @"{" : @92,
        @"|" : @93,
        @"}" : @94,
        @"~" : @95
    };
}

- (NSOrderedSet*)orderedCharacterSet
{
    return [[NSOrderedSet alloc] initWithArray:@[
        // Space character
        @" ",

        // Numbers
        @"9",
        @"8",
        @"7",
        @"6",
        @"5",
        @"4",
        @"3",
        @"2",
        @"1",
        @"0",

        // Uppercase characters
        @"Z",
        @"Y",
        @"X",
        @"W",
        @"V",
        @"U",
        @"T",
        @"S",
        @"R",
        @"Q",
        @"P",
        @"O",
        @"N",
        @"M",
        @"L",
        @"K",
        @"J",
        @"I",
        @"H",
        @"G",
        @"F",
        @"E",
        @"D",
        @"C",
        @"B",
        @"A",

        // Lowecase characters
        @"z",
        @"y",
        @"x",
        @"w",
        @"v",
        @"u",
        @"t",
        @"s",
        @"r",
        @"q",
        @"p",
        @"o",
        @"n",
        @"m",
        @"l",
        @"k",
        @"j",
        @"i",
        @"h",
        @"g",
        @"f",
        @"e",
        @"d",
        @"c",
        @"b",
        @"a",

        // Empty character
        @"",

        // Punctuation
        @"!",
        @"\"",
        @"#",
        @"$",
        @"%",
        @"&",
        @"'",
        @"(",
        @")",
        @"*",
        @"+",
        @",",
        @"-",
        @".",
        @"/",
        @":",
        @";",
        @"<",
        @"=",
        @">",
        @"?",
        @"@",
        @"[",
        @"\\",
        @"]",
        @"^",
        @"_",
        @"`",
        @"{",
        @"|",
        @"}",
        @"~"
    ]];
}

- (NSInteger)indexOfCharacter:(NSString*)character
{
    return [characterMap[character] integerValue];
}

- (void)addLabels
{
    // Add a contiguous set of labels vertically positioned based on the frame height
    for (int i = 0; i < orderedCharacterSet.count; i++) {
        CGRect rect = CGRectMake(0, 0 + (self.frame.size.height * i), self.frame.size.width, self.frame.size.height);
        SLVerticallyAlignedLabel* label = [[SLVerticallyAlignedLabel alloc] initWithFrame:rect];
        // Configure the label
        label.adjustsFontSizeToFitWidth = YES;
        [label setFont:self.font];
        [label setShadowColor:self.shadowColor];
        [label setShadowOffset:self.shadowOffset];
        NSDictionary* textAttributes = @{
            NSStrokeColorAttributeName : self.strokeColor,
            NSForegroundColorAttributeName : self.textColor,
            NSStrokeWidthAttributeName : @(-self.strokeWidth)
        };
        label.attributedText = [[NSAttributedString alloc] initWithString:orderedCharacterSet[i]
                                                               attributes:textAttributes];
        [label setVerticalAlignment:self.verticalAlignment];
        [label setTextAlignment:NSTextAlignmentCenter];
        label.textColor = self.textColor;
        // Add to subview as well as labels array
        [self addSubview:label];
        [self.labels addObject:label];
    }
}

- (NSUInteger)currentIndex
{
    // Determines index the SlotCharacter is at by checking the content offset
    // divided by the frame height
    return (NSUInteger)self.contentOffset.y / (NSUInteger)self.frame.size.height;
}

- (void)animateToIndex:(NSInteger)index
{
    [self animateToIndex:index];
}

- (void)animateToIndex:(NSInteger)index
            completion:(void (^)(void))completionBlock
{
    [self animateToIndex:index
                duration:self.animationSpeed
              completion:completionBlock];
}

- (void)animateToIndex:(NSInteger)index
              duration:(CGFloat)duration
            completion:(void (^)(void))completion
{
    [self animateToIndex:index
                duration:duration
              animations:nil
              completion:completion];
}

- (void)animateToIndex:(NSInteger)index
              duration:(CGFloat)duration
            animations:(void (^)(void))animations
            completion:(void (^)(void))completion
{
    [self animateToIndex:index
                duration:duration
                   delay:0.0f
              animations:animations
              completion:completion];
}

- (void)animateToIndex:(NSInteger)index
              duration:(CGFloat)duration
                 delay:(CGFloat)delay
            animations:(void (^)(void))animations
            completion:(void (^)(void))completion
{
    [self animateToIndex:index
                duration:duration
                   delay:delay
                 options:UIViewAnimationOptionCurveEaseInOut
              animations:animations
              completion:completion];
}

- (void)animateToIndex:(NSInteger)index
              duration:(CGFloat)duration
                 delay:(CGFloat)delay
               options:(UIViewAnimationOptions)options
            animations:(void (^)(void))animations
            completion:(void (^)(void))completion
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // Increment the animations counter to keep track if we are animating or not
        animationsCount++;

        if (index < 0 || index >= orderedCharacterSet.count) {
            [NSException raise:@"NSRangeException" format:@"Index out of range"];
        }

        // Switch the color if we have an animation color
        UIColor* preanimationColor = self.textColor;
        if (self.animationColor) {
            [self setLabelsTextColor:self.animationColor];
        }

        [UIView animateWithDuration:duration delay:delay options:options animations:^{
            if (animations) {
                animations();
            }
            [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * index)
                          animated:NO];
        }
            completion:^(BOOL finished) {
                animationsCount--;
                if (![self isAnimating]) {
                    [self setLabelsTextColor:preanimationColor];
                }
                if (completion) {
                    completion();
                }
            }];
    });
}

- (void)setToIndex:(NSInteger)index
{
    if (index < 0 || index >= orderedCharacterSet.count) {
        [NSException raise:@"NSRangeException" format:@"Index out of range"];
    }
    [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * index)
                  animated:NO];
}

- (BOOL)isAnimating
{
    if (animationsCount == 0) {
        return NO;
    }
    else {
        return YES;
    }
}

- (void)setLabelsFont:(UIFont*)font
{
    for (UIView* subView in self.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel* label = (UILabel*)subView;
            [label setFont:font];
        }
    }
}

- (void)setLabelsFontSize:(CGFloat)size
{
    for (UIView* subView in self.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel* label = (UILabel*)subView;
            [label setFont:[UIFont fontWithName:[self.font fontName] size:size]];
        }
    }
}

- (void)setLabelsTextColor:(UIColor*)color
{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* subView in self.subviews) {
            if ([subView isKindOfClass:[UILabel class]]) {
                UILabel* label = (UILabel*)subView;
                [label setTextColor:color];
            }
        }
    });
}

- (void)setLabelsShadowColor:(UIColor*)color
{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* subView in self.subviews) {
            if ([subView isKindOfClass:[UILabel class]]) {
                UILabel* label = (UILabel*)subView;
                [label setShadowColor:color];
            }
        }
    });
}

- (void)setLabelsShadowOffset:(CGSize)size
{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* subView in self.subviews) {
            if ([subView isKindOfClass:[UILabel class]]) {
                UILabel* label = (UILabel*)subView;
                [label setShadowOffset:size];
            }
        }
    });
}

- (void)setLabelsStrokeColor:(UIColor*)color
{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* subView in self.subviews) {
            if ([subView isKindOfClass:[UILabel class]]) {
                UILabel* label = (UILabel*)subView;
                NSDictionary* textAttributes = @{
                    NSStrokeColorAttributeName : color,
                    NSForegroundColorAttributeName : self.textColor,
                    NSStrokeWidthAttributeName : @(-self.strokeWidth)
                };
                label.attributedText = [[NSAttributedString alloc] initWithString:label.text attributes:textAttributes];
            }
        }
    });
}

- (void)setLabelsStrokeWidth:(CGFloat)strokeWidth
{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* subView in self.subviews) {
            if ([subView isKindOfClass:[UILabel class]]) {
                UILabel* label = (UILabel*)subView;
                NSDictionary* textAttributes = @{
                    NSStrokeColorAttributeName : self.strokeColor,
                    NSForegroundColorAttributeName : self.textColor,
                    NSStrokeWidthAttributeName : @(-strokeWidth)
                };
                label.attributedText = [[NSAttributedString alloc] initWithString:label.text attributes:textAttributes];
            }
        }
    });
}

- (void)setLabelsVerticalAlignment:(UIControlContentVerticalAlignment)alignment
{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView* subView in self.subviews) {
            if ([subView isKindOfClass:[UILabel class]]) {
                SLVerticallyAlignedLabel* label = (SLVerticallyAlignedLabel*)subView;
                [label setVerticalAlignment:alignment];
            }
        }
    });
}

- (void)assertIfNotMainThread
{
    NSAssert(NSThread.isMainThread,
        @"Error: Method needs to be called on the main thread. %@",
        [NSThread callStackSymbols]);
}

@end
