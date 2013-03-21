//
//  Validator.m
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "Validator.h"

@interface Validator()

-(BOOL) does:(NSArray*) input AsArrayMatchWith:(NSArray*) expected;
-(BOOL) does:(NSDictionary*) input AsyDictionaryMatchWith:(NSDictionary*) expected;

@end

@implementation Validator

-(id) initWithFormat:(NSDictionary *)expectedFormat
{
    if(self = [super init]) {
        self.format = expectedFormat;
    }
    
    return self;
}

-(BOOL) validate:(NSDictionary *)input
{
    
}

@end
