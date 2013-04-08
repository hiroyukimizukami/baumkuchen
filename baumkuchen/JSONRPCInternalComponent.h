//
//  JSONRPCComponent.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/21/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONRPCInternalComponent <NSObject>

//TODO rename to validateInput
-(BOOL) validateInput:(NSString*)method AndParams:(NSDictionary*)params;
-(BOOL) validateOutput:(NSString*)method AndParams:(NSArray*)output;

//TOOD add validateOutput

//Methods of a class to impl this protocol must have folloing signature.
//input -> NSDictionary*, output -> NSArray*

@end
