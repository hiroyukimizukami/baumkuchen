//
//  Procedure.h
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 2/15/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GatewayCallHandler.h"
#import "JSONRPCRequest.h"
#import "JSONRPCResponse.h"

@interface Gateway : NSObject

@property (atomic, retain) GatewayCallHandler* procedure;

-(JSONRPCResponse*) call:(JSONRPCRequest*) jsonrpcRequest;

@end
