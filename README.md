# SlotLabel

[![Version](https://img.shields.io/cocoapods/v/SlotLabel.svg?style=flat)](http://cocoapods.org/pods/SlotLabel)
[![CI Status](https://travis-ci.org/pinnrepo/SlotLabel.svg?branch=master)](https://travis-ci.org/pinnrepo/SlotLabel)
[![Doc Coverage](https://img.shields.io/cocoapods/metrics/doc-percent/SlotLabel.svg?style=flat)](http://cocoapods.org/pods/SlotLabel)
[![License](https://img.shields.io/cocoapods/l/SlotLabel.svg?style=flat)](http://cocoapods.org/pods/SlotLabel)
[![Platform](https://img.shields.io/cocoapods/p/SlotLabel.svg?style=flat)](http://cocoapods.org/pods/SlotLabel)
[![Language](https://img.shields.io/badge/language-objective--c-lightgrey.svg)](http://cocoapods.org/pods/SlotLabel)

SlotLabel is an animated variant of a UILabel that is heavily inspired by
casino slots. It was designed as a drop-in replacement for a UILabel. The 
interface provides customization properties and animation methods. Animating
the label to a string is a simple one liner, and can be customized to fit
your apps style.

### Table of Contents
---------------------

* [Features](#features)
* [Installation](#installation)
* [Interface](#interface)
* [Usage](#usage)
* [Example](#example)
* [Documentation](#documentation)
* [Implementation](#implementation)
* [Contributing](#contributing)
* [History](#history)
* [Roadmap](#roadmap)
* [License](#license)

### Features
------------

* A smooth easy to use drop in replacement for a UILabel
* Easy to customize controls
* IBDesignable and IBInspectable
* 100% Documentation coverage

### Installation
----------------

###### Cocoapods

SlotLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SlotLabel"
```

Now you can add to your project with

```objc
#import <SlotLabel/SlotLabel.h>
```

###### Source

You can clone the repo with git:

```
git clone https://github.com/pinnrepo/SlotLabel.git
```

then simply add the files to your project, and use a local import header

```objc
#import "SlotLabel.h"
```

### Interface
-------------

Heres a quick run down of all configurable properties and methods

#### SlotCharacter
------------------

###### Properties
```objc
- (void)setFont:(UIFont*)font;
- (void)setTextColor:(UIColor*)color;
- (void)setShadowColor:(UIColor*)color;
- (void)setShadowOffset:(CGSize)size;
- (void)setStrokeColor:(UIColor*)color;
- (void)setStrokeWidth:(CGFloat)width;
- (void)setAnimationSpeed:(CGFloat)animationSpeed;
- (void)setAnimationColor:(UIColor*)color;
- (void)setVerticalAlignment:(UIControlContentVerticalAlignment)alignment;
- (void)setHorizontalAlignment:(NSTextAlignment)alignment;
```

###### Methods
```objc
- (void)animateToCharacter:(unsigned char)character;
- (void)animateToCharacter:(unsigned char)character
                completion:(void (^)(void))completion;
- (void)animateToCharacter:(unsigned char)character
                  duration:(CGFloat)duration
                completion:(void (^)(void))completion;
- (void)setToCharacter:(unsigned char)character;
- (BOOL)isAnimating;
```

#### SlotLabel
--------------

###### Properties
```objc
```

###### Methods
```objc
```

### Usage
---------

##### Storyboard

Simply drag a UIView reference onto your storyboard where you would like it
to go. Then set your custom class to `SlotLabel` and your set. If you would
like you can then configure some of the IBInspectable properties via the 
storyboard attributes editor (or do it in code!). Next you will want to
create an IBOutlet for your SlotLabel instance.

Now in your view controller you can start animating:
```objc
[self.slotLabel animateToString:@"hello world"];
```

##### Programmatically

Here your just gonna do a frame init, configure, add the subview and your good
to go!

```objc
SlotLabel *slotLabel = [[SlotLabel alloc] initWithFrame:CGRectMake(100,100,200,200)];
slotLabel.animationSpeed = 2.0f;
[self.view addSubview:slotLabel];
[slotLabel animateToString:@"programmatically"];
```

### Example
-----------

Running the example app is easy and helpful to see how SlotLabel was meant
to work. 

1. Clone the repository - `git clone https://github.com/pinnrepo/SlotLabel.h`
2. Open the workspace - `open Example/SlotLabel.xcworkspace`
3. Compile and run for simulator or device

### Documentation
-----------------

You can check out the full reference documentation
[here](http://cocoadocs.org/docsets/SlotLabel/).

### Implementation
------------------

SlotLabel is an effective UIScrollView hack, the basic magic works by
positioning UILabels vertically within the UIScrollView, then to animate
to a specific character an offset is calculated to shift content. The
SlotCharacter does the heavy lifting as far as animation and custom
configuration go. The SlotLabel itself just positions the SlotCharacters
horizontally next to each other to behave as a label. The SlotLabel just
has to orchestrate the correct values to its child SlotCharacter instances.

### Contributing
----------------

Got a great idea and want to contribute? Here's how you can help...

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

### History
-----------

For complete release notes check out the [changelog](https://github.com/pinnrepo/SlotLabel/blob/master/CHANGELOG.md)

### Roadmap
-----------

* Comprehensive testing suite
* Additional label customization options
* Dynamic slot label resizing
* Internationalization
* Improve performance with different character sets

### License
-----------

The MIT License (MIT)

Copyright (c) 2016 Pinn Technologies, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
