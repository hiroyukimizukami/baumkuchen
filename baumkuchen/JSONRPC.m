//
//  CommonJSONRPC.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/20/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPC.h"
#import "JSONRPCRequest.h"
#import "JSONRPCResponse.h"
#import "JSONRPCError.h"

@interface JSONRPC()

@property (nonatomic, strong) id<JSONRPCComponent> component;

@end

@implementation JSONRPC

-(id) initWithComponent:(id<JSONRPCComponent>)component
{
    if (self ==[super init]) {
        self.component = component;
    }

    return self;
}

-(JSONRPCResponse*) call:(JSONRPCRequest *)request
{
    NSString* jsonrpcId = [request jsonrpcId];
    NSString* method = [request method];
    NSDictionary* params = [request params];
    
    //TODO Handle error
    SEL selector = NSSelectorFromString(method);
    if (![[self component] respondsToSelector:selector]) {
        //TODO encapsulate type of error.
        NSNumber* code = [NSNumber numberWithInt:-32601];
        JSONRPCError* error = [[JSONRPCError alloc] initWithCode:code AndMessage:@"Method not found" AndData:@[@"The method does not exist / is not available."]];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        
        return response;
    }
    NSArray* result = [[self component] performSelector:selector withObject:params];
    
    JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithResult:result AndId:jsonrpcId];
    
    return response;
}

-(JSONRPCResponse*) notify:(JSONRPCRequest *)request
{
    //XXX Not supported yet.
    JSONRPCResponse* response = [[JSONRPCResponse alloc] init];
    return response;
}

-(JSONRPCResponse*) batch:(JSONRPCRequest *)request
{
    //XXX Not supported yet.
    JSONRPCResponse* response = [[JSONRPCResponse alloc] init];
    return response;
    
}

@end
