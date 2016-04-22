// SLVerticallyAlignedLabel.m
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

@implementation SLVerticallyAlignedLabel

- (void)drawTextInRect:(CGRect)rect
{
    if (_verticalAlignment == UIControlContentVerticalAlignmentTop || _verticalAlignment == UIControlContentVerticalAlignmentBottom) {

        CGFloat height;
        if (self.numberOfLines == 1) {
            height = ceilf(self.font.lineHeight);
        }
        else {
            height = [self sizeThatFits:self.frame.size].height;
        }

        if (height < self.frame.size.height) {
            if (_verticalAlignment == UIControlContentVerticalAlignmentTop) {
                rect.origin.y = ((self.frame.size.height - height) / 2.0) * -1.0f;
            }
            else {
                rect.origin.y = ((self.frame.size.height - height) / 2.0) * 1.0f;
            }
        }
    }
    [super drawTextInRect:rect];
}

- (void)setVerticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
{
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

@end
