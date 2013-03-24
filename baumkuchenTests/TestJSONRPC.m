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
#import "JSONRPCError.h"

@implementation TestJSONRPC

-(void) testUseOk
{
    MockJSONRPCComponent* mockComponent = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc;
    STAssertNoThrow(jsonrpc = [[JSONRPC alloc] initWithComponent:mockComponent], @"use ok");
    jsonrpc = Nil;
}

-(void) testCallOk
{
    MockJSONRPCComponent* mockComponent = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc = [[JSONRPC alloc] initWithComponent:mockComponent];
    
    NSDictionary* param = [NSDictionary dictionaryWithObject:@"hoge" forKey:@"key"];
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookup"];
    JSONRPCResponse* response;
    
    STAssertNoThrow(response = [jsonrpc call:request], @"call without params");
    STAssertNotNil([response result], @"result exists");
    STAssertEquals([response jsonrpcId], @"0", @"id is");
    STAssertEquals([response jsonrpc], @"2.0", @"jsonrpc is");
    STAssertNil([response error], @"error is");

    NSDictionary* r = [[response result] objectAtIndex:0];
    NSDictionary* got = [r objectForKey:@"result"];
    STAssertEquals([got objectForKey:@"key"], [param objectForKey:@"key"], @"response is");
    
    jsonrpc = Nil;
}

-(void) testErrorMethodNotFound
{
    MockJSONRPCComponent* mockComponent = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc = [[JSONRPC alloc] initWithComponent:mockComponent];
    
    NSDictionary* param = [NSDictionary dictionaryWithObject:@"hoge" forKey:@"key"];
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"hoge"];
    JSONRPCResponse* response;
    
    STAssertNoThrow(response = [jsonrpc call:request], @"call without params");
    STAssertNil([response result], @"result exists");
    STAssertEquals([response jsonrpcId], @"0", @"id is");
    STAssertEquals([response jsonrpc], @"2.0", @"jsonrpc is");
    STAssertNotNil([response error], @"error is");
    STAssertEqualObjects([[response error] code], [NSNumber numberWithInt:-32601], @"error is");
    
    jsonrpc = Nil;
    
}

-(void) testErrorInvalidParams
{
    MockJSONRPCComponent* mockComponent = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc = [[JSONRPC alloc] initWithComponent:mockComponent];
    
    NSDictionary* param = [NSDictionary dictionaryWithObject:@"hoge" forKey:@"failure"];
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookup"];
    JSONRPCResponse* response;
    
    STAssertNoThrow(response = [jsonrpc call:request], @"call without params");
    STAssertNil([response result], @"result exists");
    STAssertEquals([response jsonrpcId], @"0", @"id is");
    STAssertEquals([response jsonrpc], @"2.0", @"jsonrpc is");
    STAssertNotNil([response error], @"error is");
    STAssertEqualObjects([[response error] code], [NSNumber numberWithInt:-32602], @"error is");
    
    jsonrpc = Nil;
    
}

-(void) testErrorInternalError
{
    MockJSONRPCComponent* mockComponent = [[MockJSONRPCComponent alloc] init];
    JSONRPC* jsonrpc = [[JSONRPC alloc] initWithComponent:mockComponent];
    
    NSDictionary* param = [NSDictionary dictionaryWithObject:@"hoge" forKey:@"error"];
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookup"];
    JSONRPCResponse* response;
    
    STAssertNoThrow(response = [jsonrpc call:request], @"call without params");
    STAssertNil([response result], @"result exists");
    STAssertEquals([response jsonrpcId], @"0", @"id is");
    STAssertEquals([response jsonrpc], @"2.0", @"jsonrpc is");
    STAssertNotNil([response error], @"error is");
    STAssertEqualObjects([[response error] code], [NSNumber numberWithInt:-32603], @"error is");
    
    jsonrpc = Nil;
    
}

@end
