//
//  GatewayJSONRPCResponse.m
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCResponse.h"
#import "SBJson.h"

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

-(id) initWithJSON:(NSString *)json
{
    id arrayOrDict = [[SBJsonParser new] objectWithString:json];
    if ([arrayOrDict isKindOfClass:[NSArray class]]) {
        [NSException raise:@"InvalidArgumentException" format:@"Invalid json format."];
    }
    
    NSDictionary* response = arrayOrDict;
    if (self == [super init]) {
        if ([response objectForKey:@"jsonrpcId"] != Nil) {
            self.jsonrpcId = [response objectForKey:@"jsonrpcId"];
        }
        self.jsonrpc = @"2.0";
        if ([response objectForKey:@"result"]) {
            self.result = [response objectForKey:@"result"];
        }
        if ([response objectForKey:@"error"]) {
            self.error = [response objectForKey:@"error"];
        }
    }

    return self;
}

-(NSDictionary*) toDictionary
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

-(NSString*) toJSON
{
    NSDictionary* me = [self toDictionary];
    return [[SBJsonWriter new] stringWithObject:me];
}


@end
