//
//  JSONRPCErrorInvalidParams.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCErrorInvalidParams.h"

@implementation JSONRPCErrorInvalidParams

@synthesize code=code;
@synthesize message=message;
@synthesize data=data;

-(id) init
{
    if (self = [super init]) {
        self.code = [NSNumber numberWithInt:-32602];
        self.message  = @"nvalid params";
        self.data = [NSArray array];
    }
    
    return self;
}

-(id) initWithData:(NSArray *)dataArray
{
    if (self = [super init]) {
        self.code = [NSNumber numberWithInt:-32602];
        self.message  = @"nvalid params";
        self.data = dataArray;
    }
    
    return self;
    
}

@end
