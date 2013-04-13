//
//  TestDataSrouce.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 4/10/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestDataSource.h"
#import "DataSource.h"
#import "MockDSEngineImpl.h"
#import "TestDBUtil.h"

@implementation TestDataSource

-(void) testUseOk
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds;
    STAssertNoThrow(ds = [[DataSource alloc] initWithEngine:impl], @"use ok");
}

-(void) testSelectOne
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds = [[DataSource alloc] initWithEngine:impl];

    NSString* sql  = @"select 1 from dual";
    NSNumber* primary = @1;
    
    [ds selectOne:sql With:primary];
    
    NSString* passedSQL = [[impl latestParams] objectForKey:@"sql"];
    NSDictionary* passedParam = [[impl latestParams] objectForKey:@"param"];
    NSNumber* passedPrimary = [passedParam objectForKey:@"id"];
    STAssertEquals(sql, passedSQL, @"sql is");
    STAssertEquals(primary, passedPrimary, @"param is"); //It would compare value's allocation?
}

-(void) testSelectAll
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds = [[DataSource alloc] initWithEngine:impl];
    
    NSString* sql  = @"select 1 from dual";
    
    [ds selectAll:sql];
    
    NSString* passedSQL = [[impl latestParams] objectForKey:@"sql"];
    NSDictionary* passedParam = [[impl latestParams] objectForKey:@"param"];
    STAssertEquals(sql, passedSQL, @"sql is");
    STAssertEquals(@{}, passedParam, @"param is"); //It would compare value's allocation?
}


@end
