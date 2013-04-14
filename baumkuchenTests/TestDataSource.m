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
    STAssertEqualObjects(primary, passedPrimary, @"param is");
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
    STAssertEqualObjects(@{}, passedParam, @"param is");
}

-(void) testSelectSome
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds = [[DataSource alloc] initWithEngine:impl];
    
    NSString* sql  = @"select 1 from dual";
    NSDictionary* param = @{@"ppp" : @"hoge"};
    
    [ds selectSome:sql With:param];
    
    NSString* passedSQL = [[impl latestParams] objectForKey:@"sql"];
    NSDictionary* passedParam = [[impl latestParams] objectForKey:@"param"];
    STAssertEquals(sql, passedSQL, @"sql is");
    STAssertEqualObjects(@{@"ppp" : @"hoge"}, passedParam, @"param is");
}

-(void) testRemove
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds = [[DataSource alloc] initWithEngine:impl];
    
    NSString* sql  = @"delete from hoge where id = ?";
    NSDictionary* param = @{@"id" : @1};
    NSDictionary* mirror = [NSDictionary dictionaryWithDictionary:param];
    
    [ds remove:sql With:param];
    
    NSString* passedSQL = [[impl latestParams] objectForKey:@"sql"];
    NSDictionary* passedParam = [[impl latestParams] objectForKey:@"param"];
    STAssertEquals(sql, passedSQL, @"sql is");
    STAssertEqualObjects(mirror, passedParam, @"param is");
}

-(void) testUpdate
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds = [[DataSource alloc] initWithEngine:impl];
    
    NSString* sql  = @"update hoge set updated_at = ? where id = ?";
    NSDictionary* param = @{@"id" : @1, @"updated_at" : @2};
    NSDictionary* mirror = [NSDictionary dictionaryWithDictionary:param];
    
    [ds update:sql With:param];
    
    NSString* passedSQL = [[impl latestParams] objectForKey:@"sql"];
    NSDictionary* passedParam = [[impl latestParams] objectForKey:@"param"];
    STAssertEquals(sql, passedSQL, @"sql is");
    STAssertEqualObjects(mirror, passedParam, @"param is");
}

-(void) testInsert
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds = [[DataSource alloc] initWithEngine:impl];
    
    NSString* sql  = @"insert into hoge(id, created_at, updated_at) values(?, ?, ?);";
    NSDictionary* param = @{@"id" : @1, @"created_at" : @2, @"updated_at" : @3};
    NSDictionary* mirror = [NSDictionary dictionaryWithDictionary:param];
    
    [ds insert:sql With:param];
    
    NSString* passedSQL = [[impl latestParams] objectForKey:@"sql"];
    NSDictionary* passedParam = [[impl latestParams] objectForKey:@"param"];
    STAssertEquals(sql, passedSQL, @"sql is");
    STAssertEqualObjects(mirror, passedParam, @"param is");
}

@end
