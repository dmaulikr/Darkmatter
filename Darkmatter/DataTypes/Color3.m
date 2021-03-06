//
//  Color3.m
//  Darkmatter
//
//  Created by Matt Rubin on 12/26/10.
//  Copyright 2010. All rights reserved.
//

#import "Color3.h"
#import "Color4.h"

@implementation Color3

#pragma mark Properties
@synthesize red;
@synthesize green;
@synthesize blue;

- (double)luminance {
	//coefficients taken from libst/STColor3f.cpp
	return .2126f*self.red + .7152f*self.green + .0722f*self.blue;
}

#pragma mark Initializers

- (id)init {
	if((self = [super init])){
		red   = 0;
		green = 0;
		blue  = 0;
	}
	return self;
}

- (id)initWithRed:(double)r green:(double)g blue:(double)b {
	if((self = [super init])){
		red   = r;
		green = g;
		blue  = b;
	}
	return self;
}

- (id)initWithBrightness:(double)b {
	if((self = [super init])){
		red   = b;
		green = b;
		blue  = b;
	}
	return self;
}


- (id)initWithColor3:(Color3*)c {
	if((self = [super init])){
		red   = c.red;
		green = c.green;
		blue  = c.blue;
	}
	return self;
}

- (id)initWithColor4:(Color4*)c {
	if((self = [super init])){
		red   = c.red;
		green = c.green;
		blue  = c.blue;
	}
	return self;
}


#pragma mark Arithmetic



#pragma mark Class methods

+ (Color3 *)colorWithRed:(double)r green:(double)g blue:(double)b {
	return [[[Color3 alloc] initWithRed:r green:g blue:b] autorelease];
}

#pragma mark Color presets

+ (Color3 *)red {
	return [Color3 colorWithRed:1 green:0 blue:0];
}
+ (Color3 *)yellow {
	return [Color3 colorWithRed:1 green:1 blue:0];
}
+ (Color3 *)green {
	return [Color3 colorWithRed:0 green:1 blue:0];
}
+ (Color3 *)cyan {
	return [Color3 colorWithRed:0 green:1 blue:1];
}
+ (Color3 *)blue {
	return [Color3 colorWithRed:0 green:0 blue:1];
}
+ (Color3 *)magenta {
	return [Color3 colorWithRed:1 green:0 blue:1];
}
+ (Color3 *)black {
	return [Color3 colorWithRed:0 green:0 blue:0];
}
+ (Color3 *)white {
	return [Color3 colorWithRed:1 green:1 blue:0];
}


#pragma mark Color4 converters

- (Color4 *)color4 {
	return [Color4 colorWithRed:self.red green:self.green blue:self.blue alpha:1];
}
- (Color4 *)color4WithAlpha:(double)alpha {
	return [Color4 colorWithRed:self.red green:self.green blue:self.blue alpha:alpha];
}


#pragma mark Description

-(NSString *)description {
	return [NSString stringWithFormat:@"%@[r:%f g:%f b:%f]", [self class], self.red, self.green, self.blue];
}

@end
