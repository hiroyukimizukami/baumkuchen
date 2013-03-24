//
//  TestJSONRPCRequest.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/24/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestJSONRPCRequest.h"
#import "JSONRPCRequest.h"
#import "SBJson.h"

@implementation TestJSONRPCRequest

-(void) testCreateWithJSON
{
    NSDictionary* request = @{@"id" : @"0",
                             @"method" : @"hoge",
                              @"params" : @{@"body" : @"bla"}
                             };
    NSString* requestAsJSON = [[SBJsonWriter new] stringWithObject:request];
    
    JSONRPCRequest* target;
    STAssertNoThrow(target = [[JSONRPCRequest alloc] initWithJSON:requestAsJSON], @"use ok");
    STAssertEqualObjects([target jsonrpcId], @"0", @"id is");
    STAssertEqualObjects([target params], @{@"body" : @"bla"}, @"params is");
    STAssertEqualObjects([target jsonrpc], @"2.0", @"jsonrpc is");
    STAssertEqualObjects([target method], @"hoge", @"method is");
}

-(void) testToJSON
{
    NSDictionary* params = @{@"body" : @"bla"};
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:params AndId:@"0" AndMethod:@"hoge"];
    STAssertNotNil([request toJSON], @"to JSON ok");
    
}

@end
