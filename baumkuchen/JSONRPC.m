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
#import "JSONRPCErrorMethodNotFound.h"
#import "JSONRPCErrorInvalidParams.h"
#import "JSONRPCErrorInternalError.h"

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
    NSString* methodName = [request method];
    NSDictionary* params = [request params];

    NSString* methodNameWithArgType = [methodName stringByAppendingString:@":"];
    SEL method = NSSelectorFromString(methodNameWithArgType);
    if (![[self component] respondsToSelector:method]) {
        JSONRPCErrorMethodNotFound* error = [[JSONRPCErrorMethodNotFound alloc] init];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        
        return response;
    }

    if (![[self component] validate:methodName AndParams:params]) {
        JSONRPCErrorInvalidParams* error = [[JSONRPCErrorInvalidParams alloc] init];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        
        return response;
    }

    @try {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        NSArray* result = [[self component] performSelector:method withObject:params];
        #pragma clang diagnostic pop
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithResult:result AndId:jsonrpcId];
        
        return response;
    } @catch (NSException* e) {
        JSONRPCErrorInternalError* error = [[JSONRPCErrorInternalError alloc] init];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        e = Nil;

        return response;
    }
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
