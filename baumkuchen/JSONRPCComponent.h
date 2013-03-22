//
//  JSONRPCComponent.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/21/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONRPCComponent <NSObject>

-(BOOL) validate:(NSString*)method AndParams:(NSDictionary*)params;

@end
