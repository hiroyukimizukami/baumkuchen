//
//  CommonJSONRPC.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/20/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONRPCComponent.h"
#import "JSONRPCInternalComponent.h"


@interface JSONRPCInternal : NSObject<JSONRPCComponent>

@property (strong, nonatomic)NSString* appNamespace;

-(id) initWithAppNamespace:(NSString*) appNamespace;

@end
