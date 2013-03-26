//
//  TestJSONRPCInternal.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestJSONRPCInternal.h"
#import "JSONRPCInternal.h"
#import "MockJSONRPCInternalComponent.h"
#import "JSONRPCRequest.h"
#import "JSONRPCRequest.h"
#import "JSONRPCErrorMethodNotFound.h"
#import "JSONRPCErrorInvalidParams.h"
#import "JSONRPCErrorInternalError.h"

@implementation TestJSONRPCInternal

-(void) testCreateOk
{
    MockJSONRPCInternalComponent* component = [[MockJSONRPCInternalComponent alloc] init];
    JSONRPCInternal* internal;
    STAssertNoThrow(internal = [[JSONRPCInternal alloc] initWithComponent:component], @"crete ok");
}

-(void) testCallOk
{
    MockJSONRPCInternalComponent* component = [[MockJSONRPCInternalComponent alloc] init];
    JSONRPCInternal* internal = [[JSONRPCInternal alloc] initWithComponent:component];
    
    NSDictionary* param = @{@"hoo" : @"bar"};
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookup"];
    
    JSONRPCResponse* response;
    STAssertNoThrow(response = [internal call:request], @"call ok");
    STAssertNotNil([response result], @"result ok");
    STAssertNil([response error], @"error is nil");
}

-(void) testCallMethodButDoesntExist
{
    MockJSONRPCInternalComponent* component = [[MockJSONRPCInternalComponent alloc] init];
    JSONRPCInternal* internal = [[JSONRPCInternal alloc] initWithComponent:component];
    
    NSDictionary* param = @{@"hoo" : @"bar"};
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"hoge"];
    
    JSONRPCResponse* response;
    STAssertNoThrow(response = [internal call:request], @"call ok");
    STAssertNil([response result], @"result is nil");
    STAssertNotNil([response error], @"error ok");
    STAssertTrue([[response error] isKindOfClass:[JSONRPCErrorMethodNotFound class]], @"error is Method Not Found");
}

-(void) testCallInvalidParams
{
    MockJSONRPCInternalComponent* component = [[MockJSONRPCInternalComponent alloc] init];
    JSONRPCInternal* internal = [[JSONRPCInternal alloc] initWithComponent:component];
    
    NSDictionary* param = @{@"failure" : @"bar"};
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookup"];
    
    JSONRPCResponse* response;
    STAssertNoThrow(response = [internal call:request], @"call ok");
    STAssertNil([response result], @"result is nil");
    STAssertNotNil([response error], @"error ok");
    STAssertTrue([[response error] isKindOfClass:[JSONRPCErrorInvalidParams class]], @"error is Method Not Found");
}

-(void) testCallInternalError
{
    MockJSONRPCInternalComponent* component = [[MockJSONRPCInternalComponent alloc] init];
    JSONRPCInternal* internal = [[JSONRPCInternal alloc] initWithComponent:component];
    
    NSDictionary* param = @{@"error" : @"bar"};
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"lookup"];
    
    JSONRPCResponse* response;
    STAssertNoThrow(response = [internal call:request], @"call ok");
    STAssertNil([response result], @"result is nil");
    STAssertNotNil([response error], @"error ok");
    STAssertTrue([[response error] isKindOfClass:[JSONRPCErrorInternalError class]], @"error is Method Not Found");
    
}


@end
