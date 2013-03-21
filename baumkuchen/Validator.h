//
//  Validator.h
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject

@property (nonatomic, retain) NSDictionary* format;

-(id) initWithFormat:(NSDictionary*) expectedFormat;
-(BOOL) validate:(NSDictionary*) input;

@end
