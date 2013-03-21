//
//  Procedure.m
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 2/15/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "Gateway.h"
#import "GatewayCallHandler.h"


@implementation Gateway

-(id) initWithMethod:(NSString *)method
{
    if(self = [super init]) {
        GatewayCallHandler* procedure = [[NSClassFromString(method) alloc] init];
        self.procedure = procedure;
    }
    return self;
}

-(JSONRPCResponse*) call:(JSONRPCRequest*) jsonrpcRequest;
{
    return [NSDictionary dictionary];
}

@end
