//
//  MockJSONRPCComponent.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "MockJSONRPCComponent.h"

@implementation MockJSONRPCComponent

-(BOOL) validate:(NSString*)method AndParams:(NSDictionary *)params
{
    return TRUE;
}

-(NSDictionary*) lookupWithoutParams
{
    return [NSDictionary dictionaryWithObject:@"v" forKey:@"result"];
}

-(NSDictionary*) lookupWithParams:(NSDictionary*)params
{
    return [NSDictionary dictionaryWithObject:params forKey:@"result"];
}


@end
