//
//  CommonJSONRPC.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/20/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRPCComponent.h"
#import "JSONRPCRequest.h"
#import "JSONRPCResponse.h"

@interface JSONRPC : NSObject


-(id) initWithComponent:(id<JSONRPCComponent>) component;

-(JSONRPCResponse*) call:(JSONRPCRequest*) request;
-(JSONRPCResponse*) notify:(JSONRPCRequest*) request;
-(JSONRPCResponse*) batch:(JSONRPCRequest*) request;

@end
