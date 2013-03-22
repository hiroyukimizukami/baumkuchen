//
//  TestJSONRPC.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestJSONRPC.h"
#import "JSONRPC.h"
#import "MockJSONRPCComponent.h"
#import "JSONRPCRequest.h"
#import "JSONRPCResponse.h"

@implementation TestJSONRPC

-(void) testUseOk
{
    MockJSONRPCComponent* mockComponent = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc;
    STAssertNoThrow(jsonrpc = [[JSONRPC alloc] initWithComponent:mockComponent], @"use ok");
    jsonrpc = Nil;
}

-(void) testCallWithoutParamsOk
{
    MockJSONRPCComponent* mockComponent = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc = [[JSONRPC alloc] initWithComponent:mockComponent];
    
    NSDictionary* param = [NSDictionary dictionary];
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookupWithoutParams"];
    JSONRPCResponse* response;
    
    STAssertNoThrow(response = [jsonrpc call:request], @"call without params");
    STAssertNotNil([response result], @"result exists");
    STAssertEquals([response jsonrpcId], @"0", @"id is");
    STAssertEquals([response jsonrpc], @"2.0", @"jsonrpc is");
    STAssertNil([response error], @"error is");
    
    
    jsonrpc = Nil;
    
}

-(void) testCallWithParamsOk
{
    MockJSONRPCComponent* mockComponent = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc = [[JSONRPC alloc] initWithComponent:mockComponent];
    
    NSDictionary* param = [NSDictionary dictionaryWithObject:@"hoge" forKey:@"key"];
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookupWithParams"];
    JSONRPCResponse* response;
    
    STAssertNoThrow(response = [jsonrpc call:request], @"call without params");
    STAssertNotNil([response result], @"result exists");
    
    NSDictionary* r = [[response result] objectAtIndex:0];
    NSString* got = [r objectForKey:@"key"];
    
    STAssertEquals(got, [param objectForKey:@"key"], @"response is");
    
    jsonrpc = Nil;
    
}

@end
