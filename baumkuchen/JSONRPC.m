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
    
    //TODO Handle error
    SEL method = NSSelectorFromString(methodName);
    if (![[self component] respondsToSelector:method]) {
        JSONRPCErrorMethodNotFound* error = [[JSONRPCErrorMethodNotFound alloc] init];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        
        return response;
    }

    // http://stackoverflow.com/questions/10793116/to-prevent-warning-from-performselect-may-cause-a-leak-because-its-selector-is
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"

    SEL validator = NSSelectorFromString(@"validate");
    if (![[self component] performSelector:validator withObject:methodName withObject:params]) {
        JSONRPCErrorInvalidParams* error = [[JSONRPCErrorInvalidParams alloc] init];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        
        return response;
    }
    
    NSArray* result = [[self component] performSelector:method withObject:params];
    #pragma clang diagnostic pop

    
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
