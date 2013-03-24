//
//  GatewayJSONRPCRequest.m
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCRequest.h"
#import "SBJson.h"

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

-(id) initWithJSON:(NSString *)json
{
    id arrayOrDict = [[SBJsonParser new] objectWithString:json];
    if ([arrayOrDict isKindOfClass:[NSArray class]]) {
        [NSException raise:@"InvalidArgumentException" format:@"Invalid json format."];
    }
    NSDictionary* params = arrayOrDict;
    if (self == [super init]) {
        self.method = [params objectForKey:@"method"];
        self.jsonrpc = @"2.0";
        self.params = [params objectForKey:@"params"];
        if ([params objectForKey:@"id"] != Nil) {
            self.jsonrpcId = [params objectForKey:@"id"];
        }
    }

    return self;
}

-(NSDictionary*) toDictionary
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

-(NSString*) toJSON
{
    NSDictionary* me = [self toDictionary];
    return [[SBJsonWriter new] stringWithObject:me];
}

@end
