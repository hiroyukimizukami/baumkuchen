//
//  TestJSONRPCErrorMethodNotFound.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestJSONRPCErrorMethodNotFound.h"
#import "JSONRPCErrorMethodNotFound.h"

@implementation TestJSONRPCErrorMethodNotFound

-(void) testUseOk
{
    JSONRPCErrorMethodNotFound* error = [[JSONRPCErrorMethodNotFound alloc] init];
    STAssertNotNil(error, @"create ok");
}

-(void) testUseWithDataOk
{
    NSArray* info = [NSArray arrayWithObject:@"info"];
    JSONRPCErrorMethodNotFound* error = [[JSONRPCErrorMethodNotFound alloc] initWithData:info];
    STAssertNotNil(error, @"create ok");

}

@end
