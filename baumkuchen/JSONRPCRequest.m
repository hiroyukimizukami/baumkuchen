//
//  GatewayJSONRPCRequest.m
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCRequest.h"

@implementation JSONRPCRequest

-(id) initWithParams:(NSDictionary*)params AndId:(NSString*) jsonrpcId AndMethod:(NSString*)method;
{
    if (self == [super init]) {
        self.jsonrpcId = jsonrpcId;
        self.jsonrpc = @"2.0";
        self.method = method;
        self.params = params;
    }
    
    return self;
}

-(id) initWithParamsForNotification:(NSDictionary*)params AndMethod:(NSString*)method;
{
    if (self == [super init]) {
        self.method = method;
        self.jsonrpc = @"2.0";        
        self.params = params;
    }
    
    return self;
}

-(NSDictionary*) build
{
    NSDictionary* params = [self params];
    if (params == Nil) {
        params = [NSDictionary dictionary];
    }

    NSMutableDictionary* request = [NSMutableDictionary dictionary];
    [request setObject:@"2.0" forKey:@"jsonrpc"];
    [request setObject:[self method] forKey:@"method"];
    [request setObject:params forKey:@"params"];
    

    if ([self jsonrpcId] != Nil) {
        [request setObject:[self jsonrpcId] forKey:@"id"];
    }
    
    return request;
}

@end
