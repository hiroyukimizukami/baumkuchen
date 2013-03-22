//
//  GatewayJSONRPCResponse.m
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCResponse.h"

@implementation JSONRPCResponse

-(id) initWithError:(id<JSONRPCError>) error AndId:(NSString*) jsonrpcId;
{
    if (self == [super init]) {
        self.jsonrpcId = jsonrpcId;
        self.jsonrpc = @"2.0";
        self.error = error;
    }
    
    return self;
}

-(id) initWithResult:(NSArray*) result AndId:(NSString*) jsonrpcId;
{
    if (self == [super init]) {
        self.jsonrpcId = jsonrpcId;
        self.jsonrpc = @"2.0";
        self.result = result;
    }
    
    return self;
}

-(id) initWithErrorForNotification:(id<JSONRPCError>)error
{
    if (self == [super init]) {
        self.jsonrpc = @"2.0";
        self.error = error;
    }
    
    return self;
}

-(id) initWithResultForNotification:(NSArray *)result
{
    if (self == [super init]) {
        self.result = result;
        self.jsonrpc = @"2.0";
    }
    
    return self;
    
}


-(NSDictionary*) build
{
    NSMutableDictionary* response = [NSMutableDictionary dictionary];
    [response setObject:@"2.0" forKey:@"jsonrpc"];
    
    if ([self error] != Nil) {
        [response setObject:[self error] forKey:@"error"];
    }
    
    if ([self result] != Nil) {
        [response setObject:[self result] forKey:@"result"];
    }
    
    if ([self jsonrpcId] != Nil) {
        [response setObject:[self jsonrpcId] forKey:@"id"];
    }

    return response;
    
}

@end
