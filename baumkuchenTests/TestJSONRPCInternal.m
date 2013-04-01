//
//  TestJSONRPCInternal.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestJSONRPCInternal.h"
#import "JSONRPCInternal.h"
#import "JSONRPCRequest.h"
#import "JSONRPCRequest.h"
#import "JSONRPCErrorMethodNotFound.h"
#import "JSONRPCErrorInvalidParams.h"
#import "JSONRPCErrorInternalError.h"

@implementation TestJSONRPCInternal

-(void) testCreateOk
{
    JSONRPCInternal* internal;
    STAssertNoThrow(internal = [[JSONRPCInternal alloc] initWithAppNamespace:@"com.baumkuchen.test"], @"crete ok");
}

-(void) testCallOk
{
    JSONRPCInternal* internal = [[JSONRPCInternal alloc] initWithAppNamespace:@"com.baumkuchen.test"];

    NSDictionary* param = @{@"hoo" : @"bar"};
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"com.baumkuchen.test.mock.lookup"];
    
    JSONRPCResponse* response;
    STAssertNoThrow(response = [internal call:request], @"call ok");
    STAssertNotNil([response result], @"result ok");
    STAssertNil([response error], @"error is nil");
}

-(void) testCallMethodButDoesntExist
{
    JSONRPCInternal* internal = [[JSONRPCInternal alloc] initWithAppNamespace:@"com.baumkuchen.test"];
    
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
    JSONRPCInternal* internal = [[JSONRPCInternal alloc] initWithAppNamespace:@"com.baumkuchen.test"];
    
    NSDictionary* param = @{@"failure" : @"bar"};
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"com.baumkuchen.test.mock.lookup"];
    
    JSONRPCResponse* response;
    STAssertNoThrow(response = [internal call:request], @"call ok");
    STAssertNil([response result], @"result is nil");
    STAssertNotNil([response error], @"error ok");
    STAssertTrue([[response error] isKindOfClass:[JSONRPCErrorInvalidParams class]], @"error is Method Not Found");
}

-(void) testCallInternalError
{
    JSONRPCInternal* internal = [[JSONRPCInternal alloc] initWithAppNamespace:@"com.baumkuchen.test"];
    
    NSDictionary* param = @{@"error" : @"bar"};
    JSONRPCRequest* request = [[JSONRPCRequest alloc] initWithParams:param AndId:@"0" AndMethod:@"com.baumkuchen.test.mock.lookup"];
    
    JSONRPCResponse* response;
    STAssertNoThrow(response = [internal call:request], @"call ok");
    STAssertNil([response result], @"result is nil");
    STAssertNotNil([response error], @"error ok");
    STAssertTrue([[response error] isKindOfClass:[JSONRPCErrorInternalError class]], @"error is Method Not Found");
}


@end
