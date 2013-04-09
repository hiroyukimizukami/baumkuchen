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

@implementation TestDataSource

-(void) testUseOk
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds;
    STAssertNoThrow(ds = [[DataSource alloc] initWithEngine:impl], @"use ok");
}

-(void) testQueryOk
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds = [[DataSource alloc] initWithEngine:impl];

    NSString* sql  = @"select 1 from dual";
    NSDictionary* param = @{@"id" : @"0"};

    NSArray* selectors = @[@"inspectQuery:"];
    impl.inspector = self;
    impl.selectors = selectors;

    [ds query:sql WithParam:param];
}

-(void) testCommandOk
{
    MockDSEngineImpl* impl = [[MockDSEngineImpl alloc] init];
    DataSource* ds = [[DataSource alloc] initWithEngine:impl];
    
    NSString* sql  = @"update set id = 1 where id = :id";
    NSDictionary* param = @{@"id" : @"0"};
    
    NSArray* selectors = @[@"inspectCommand:"];
    impl.inspector = self;
    impl.selectors = selectors;
    impl.mockedResult = [NSArray array];
    
    [ds query:sql WithParam:param];
    
}

-(void) inspectQuery:(NSArray*)param
{
    NSString* sql = [param objectAtIndex:0];
    NSDictionary* dump = (NSDictionary*) [param objectAtIndex:1];
    STAssertNotNil(sql, @"sql ok");
    STAssertNotNil(dump, @"param ok");
}

-(void) inspectCommand:(NSArray*)param
{
    NSString* sql = [param objectAtIndex:0];
    NSDictionary* dump = (NSDictionary*) [param objectAtIndex:1];
    STAssertNotNil(sql, @"sql ok");
    STAssertNotNil(dump, @"param ok");
}


@end
