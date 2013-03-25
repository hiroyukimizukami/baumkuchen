//
//  JSONRPC.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/26/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRPCComponent.h"

@interface JSONRPC : NSObject

-(id) initWithCompopnent:(id<JSONRPCComponent>)component;
-(JSONRPCResponse*) call:(JSONRPCRequest*) request;
-(JSONRPCResponse*) notify:(JSONRPCRequest*) request;
-(NSArray*) batch:(NSArray*) requests;

@end
