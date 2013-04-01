//
//  CommonJSONRPC.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/20/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCInternal.h"
#import "JSONRPCInternalComponent.h"
#import "JSONRPCRequest.h"
#import "JSONRPCResponse.h"
#import "JSONRPCErrorMethodNotFound.h"
#import "JSONRPCErrorInvalidParams.h"
#import "JSONRPCErrorInternalError.h"

@interface JSONRPCInternal()

-(id<JSONRPCInternalComponent>) resolveClass:(NSString*)methodName;
-(NSString*) fetchFunction:(NSString*)methodName;
-(NSString*) fetchModule:(NSString*)methodName;
-(NSArray*) fetchModuleAndFucntionName:(NSString*)methodName;

@end

@implementation JSONRPCInternal

-(id) initWithAppNamespace:(NSString *)appNamespace
{
    if (self ==[super init]) {
        self.appNamespace = appNamespace;
    }

    return self;
}

-(JSONRPCResponse*) call:(JSONRPCRequest *)request
{
    NSString* jsonrpcId = [request jsonrpcId];
    NSString* methodName = [request method];
    NSDictionary* params = [request params];
    
    id<JSONRPCInternalComponent> component;
    @try {
        component = [self resolveClass:methodName];
    }
    @catch (NSException *exception) {
        JSONRPCErrorMethodNotFound* error = [[JSONRPCErrorMethodNotFound alloc] init];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        
        return response;
    }

    NSString* functionName = [self fetchFunction:methodName];
    NSString* functionNameWithArgType = [functionName stringByAppendingString:@":"];
    SEL function = NSSelectorFromString(functionNameWithArgType);
    if (![component respondsToSelector:function]) {
        JSONRPCErrorMethodNotFound* error = [[JSONRPCErrorMethodNotFound alloc] init];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        
        return response;
    }

    if (![component validate:functionName AndParams:params]) {
        JSONRPCErrorInvalidParams* error = [[JSONRPCErrorInvalidParams alloc] init];
        JSONRPCResponse* response = [[JSONRPCResponse alloc] initWithError:error AndId:jsonrpcId];
        
        return response;
    }

    @try {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        NSArray* result = [component performSelector:function withObject:params];
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

-(id<JSONRPCInternalComponent>) resolveClass:(NSString*)methodName
{
    NSString* moduleName = [self fetchModule:methodName];
    NSLog(@"%@", moduleName);
    Class module  = NSClassFromString(moduleName);
    if (module == Nil) {
        [NSException raise:@"NoClassDefFoundExcpetion" format:@"No such class can be found."];
    }
    if (![module conformsToProtocol:@protocol(JSONRPCInternalComponent)]) {
        [NSException raise:@"ClassCastException" format:@"Type mismatch."];
    }

    return [[module alloc] init];
}

-(NSString*) fetchFunction:(NSString *)methodName
{
    NSArray* moduleNextFunction = [self fetchModuleAndFucntionName:methodName];
    return [moduleNextFunction objectAtIndex:1];
}

-(NSString*) fetchModule:(NSString *)methodName
{
    NSArray* moduleNextFunction = [self fetchModuleAndFucntionName:methodName];
    NSString* moduleName = [[moduleNextFunction objectAtIndex:0] capitalizedString];
    NSString* fqdn = [moduleName stringByAppendingString:@"JSONRPCInternalComponent"];

    return fqdn;
}

-(NSArray*) fetchModuleAndFucntionName:(NSString*) methodName
{
    NSString* appNamespaceFollowedByPeriod = [[self appNamespace] stringByAppendingString:@"."];
    NSString* moduleAndFunction = [methodName stringByReplacingOccurrencesOfString:appNamespaceFollowedByPeriod withString:@""];
    NSArray* moduleNextFunction = [moduleAndFunction componentsSeparatedByString:@"."];
    if([moduleNextFunction count] != 2) {
        [NSException raise:@"InvalidArgumentException" format:@"Requested method can no longer be found."];
    }
    return moduleNextFunction;
}

@end
