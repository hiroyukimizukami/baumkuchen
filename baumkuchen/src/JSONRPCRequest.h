//
//  GatewayJSONRPCRequest.h
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONRPCRequest : NSObject

@property (nonatomic, strong) NSString* jsonrpc;
@property (nonatomic, strong) NSString* method;
@property (nonatomic, strong) NSDictionary* params;
@property (nonatomic, strong) NSString* jsonrpcId; // As instead of 'id' (circumvent reserved word).

-(id) initWithParams:(NSDictionary*)params AndId:(NSString*) jsonrpcId AndMethod:(NSString*)method;
-(id) initWithParamsForNotification:(NSDictionary*)params AndMethod:(NSString*)method;
-(NSDictionary*) build;

@end
