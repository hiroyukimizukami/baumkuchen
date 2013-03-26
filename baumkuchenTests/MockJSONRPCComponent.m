//
//  MockJSONRPCComponent.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "MockJSONRPCComponent.h"
#import "JSONRPCRequest.h"
#import "JSONRPCResponse.h"

@implementation MockJSONRPCComponent

-(JSONRPCResponse*) call:(JSONRPCRequest*)request
{

    NSArray* result = [NSArray arrayWithObject:[request params]];
    JSONRPCResponse* r = [[JSONRPCResponse alloc] initWithResult:result AndId:[request jsonrpcId]];
    return r;
}

-(JSONRPCResponse*) notify:(JSONRPCRequest*)request
{

        NSArray* result = [NSArray arrayWithObject:[request params]];
    JSONRPCResponse* r = [[JSONRPCResponse alloc] initWithResult:result AndId:[request jsonrpcId]];
    return r;
}

-(NSArray*) batch:(NSArray*)requests
{

    NSMutableArray* array = [NSMutableArray array];
    NSEnumerator* e = [requests objectEnumerator];
    id obj;
    while((obj = [e nextObject]) != Nil) {
        [array addObject:obj];
    }
    
    return array;
}


@end
