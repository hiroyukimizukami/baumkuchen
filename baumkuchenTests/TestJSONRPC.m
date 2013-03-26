//
//  TestJSONRPC.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestJSONRPC.h"
#import "JSONRPC.h"
#import "JSONRPCInternal.h"
#import "MockJSONRPCComponent.h"
#import "JSONRPCRequest.h"
#import "JSONRPCResponse.h"
#import "JSONRPCError.h"

@implementation TestJSONRPC

-(void) testUseOk
{
    MockJSONRPCComponent* c = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc;
    STAssertNoThrow(jsonrpc = [[JSONRPC alloc] initWithComponent:c], @" use jsonrpc ok");
    
    jsonrpc = Nil;
}

-(void) testCallOk
{
    MockJSONRPCComponent* c = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc = [[JSONRPC alloc] initWithComponent:c];
    
    NSDictionary* param = [NSDictionary dictionaryWithObject:@"hoge" forKey:@"key"];
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookup"];
    JSONRPCResponse* response;
    
    STAssertNoThrow(response = [jsonrpc call:request], @"call without params");
    STAssertNotNil([response result], @"result exists");
    STAssertEquals([response jsonrpcId], @"0", @"id is");
    STAssertEquals([response jsonrpc], @"2.0", @"jsonrpc is");
    STAssertNil([response error], @"error is");

    NSDictionary* r = [[response result] objectAtIndex:0];
    STAssertEquals([r objectForKey:@"key"], [param objectForKey:@"key"], @"response is");
    
    jsonrpc = Nil;
}

@end
