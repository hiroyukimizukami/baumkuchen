//
//  JSONRPCErrorInternalError.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/23/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCErrorInternalError.h"

@implementation JSONRPCErrorInternalError

@synthesize code=code;
@synthesize message=message;
@synthesize data=data;

-(id) init
{
    if (self = [super init]) {
        self.code = [NSNumber numberWithInt:-32603];
        self.message  = @"Internal error";
        self.data = [NSArray array];
    }
    
    return self;
}

-(id) initWithData:(NSArray *)dataArray
{
    if (self = [super init]) {
        self.code = [NSNumber numberWithInt:-32603];
        self.message  = @"Internal error";
        self.data = dataArray;
    }
    
    return self;
    
}


@end
