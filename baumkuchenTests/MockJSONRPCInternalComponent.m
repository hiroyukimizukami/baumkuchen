//
//  MockJSONRPCComponent.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "MockJSONRPCInternalComponent.h"

@implementation MockJSONRPCInternalComponent

-(BOOL) validateInput:(NSString*)method AndParams:(NSDictionary *)params
{
    if ([params objectForKey:@"failure"] != Nil) {
        return FALSE;
    }
    return TRUE;
}

-(BOOL) validateOutput:(NSString *)method AndParams:(NSArray *)output
{
    return TRUE;
}

-(NSArray*) lookup:(NSDictionary*)params
{
    if ([params objectForKey:@"error"]) {
        [NSException raise:@"UncaughtedException" format:@"An exception occurs"];
    }
    return [NSArray arrayWithObject:[NSDictionary dictionaryWithObject:params forKey:@"result"]];
}


@end
