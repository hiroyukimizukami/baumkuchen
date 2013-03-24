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
    if ([params objectForKey:@"failure"] != Nil) {
        return FALSE;
    }
    return TRUE;
}

-(NSArray*) lookup:(NSDictionary*)params
{
    if ([params objectForKey:@"error"]) {
        NSException* e = [NSException exceptionWithName:@"test" reason:@"you needed" userInfo:[NSDictionary dictionary]];
        [e raise];
    }
    return [NSArray arrayWithObject:[NSDictionary dictionaryWithObject:params forKey:@"result"]];
}


@end
