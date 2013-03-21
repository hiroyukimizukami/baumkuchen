//
//  GatewayJSONRPCResponse.h
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRPCError.h"

@interface JSONRPCResponse : NSObject

@property (nonatomic, strong) NSString* jsonrpc;
@property (nonatomic, strong) NSString* jsonrpcId; // As instead of 'id' (circumvent reserved word).
@property (nonatomic, strong) NSArray* result;
@property (nonatomic, strong) JSONRPCError* error;

-(id) initWithError:(JSONRPCError*) error AndId:(NSString*) jsonrpcId;
-(id) initWithResult:(NSArray*) result AndId:(NSString*) jsonrpcId;
-(id) initWithErrorForNotification:(JSONRPCError*) error;
-(id) initWithResultForNotification:(NSArray*) result;

-(NSDictionary*) build;

@end
