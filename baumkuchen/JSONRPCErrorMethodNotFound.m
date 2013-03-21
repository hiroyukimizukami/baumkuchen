//
//  JSONRPCErrorMethodNotFound.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCErrorMethodNotFound.h"

@implementation JSONRPCErrorMethodNotFound

@synthesize code=code;
@synthesize message=message;
@synthesize data=data;

-(id) init
{
    if (self = [super init]) {
        self.code = [NSNumber numberWithInt:-32601];
        self.message  = @"Method not found";
        self.data = [NSArray array];
    }
    
    return self;
}

-(id) initWithData:(NSArray *)dataArray
{
    if (self = [super init]) {
        self.code = [NSNumber numberWithInt:-32601];
        self.message  = @"Method not found";
        self.data = dataArray;
    }
    
    return self;
    
}

@end
