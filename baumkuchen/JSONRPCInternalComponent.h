//
//  JSONRPCComponent.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/21/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONRPCInternalComponent <NSObject>

-(BOOL) validate:(NSString*)method AndParams:(NSDictionary*)params;

//Methods of a class to impl this protocol must have folloing signature.
//input -> NSDictionary*, output -> NSArray*

@end
