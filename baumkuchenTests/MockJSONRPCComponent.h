//
//  MockJSONRPCComponent.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRPCComponent.h"

@interface MockJSONRPCComponent : NSObject<JSONRPCComponent>

-(NSDictionary*) lookupWithoutParams;
-(NSDictionary*) lookupWithParams:(NSDictionary*)params;

@end
