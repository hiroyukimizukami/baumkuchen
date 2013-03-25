//
//  MockJSONRPCComponent.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRPCInternalComponent.h"

@interface MockJSONRPCInternalComponent : NSObject<JSONRPCInternalComponent>

-(NSDictionary*) lookup:(NSDictionary*)params;

@end
