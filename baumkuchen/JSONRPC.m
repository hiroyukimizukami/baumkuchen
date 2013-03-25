//
//  JSONRPC.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/26/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPC.h"
#import "JSONRPCComponent.h"

@interface JSONRPC()

@property (strong, nonatomic) id<JSONRPCComponent> component;

@end

@implementation JSONRPC

-(id) initWithComponent:(id<JSONRPCComponent>)component
{
    if (self == [super init]) {
        self.component = component;
    }
    
    return self;
}

-(JSONRPCResponse*) call:(JSONRPCRequest*) request
{
    return [[self component] call:request];
}

-(JSONRPCResponse*) notify:(JSONRPCRequest*) request
{
    return [[self component] notify:request];
}

-(NSArray*) batch:(NSArray*) requests
{
    return [[self component] batch:requests];
}


@end
