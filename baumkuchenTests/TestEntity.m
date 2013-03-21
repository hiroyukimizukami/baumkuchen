//
//  EntityTest.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/17/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestEntity.h"
#import "Entity.h"

@implementation TestEntity

-(void) testUse
{
    Entity* e = [[Entity alloc] init];
    STAssertNotNil(e, @"use ok");
}

@end
