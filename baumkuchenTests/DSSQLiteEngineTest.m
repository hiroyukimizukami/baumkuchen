//
//  DSSQLiteEngine.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/17/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "DSSQLiteEngineTest.h"
#import "TestDBUtil.h"
#import "DSEngineSQLite.h"

@implementation DSSQLiteEngineTest

//-(void) testCanConnectAndCreateDB
//{
//    NSString* name = [TestDBUtil getTmpDBName];
//    DSEngineSQLite* db = [[DSEngineSQLite alloc] initWithDBName:name];
//    STAssertNotNil(db, @"use ok");
//    STAssertNotNil([db getAbsolutePath], @"db's absolute path");
//}
//
//-(void) testQuery
//{
//    NSString* name = [TestDBUtil getTmpDBName];
//    DSEngineSQLite* db = [[DSEngineSQLite alloc] initWithDBName:name];
//    STAssertNotNil(db, @"use ok");
//    STAssertNotNil([db getAbsolutePath], @"db's absolute path");
//    
//    [db open];
//    @try {
//        NSString* sql = @"select name from sql_master where type='table';";
//        STAssertNoThrow([db query:sql WithParam:@{}], @"query ok");
//    }
//    @catch (NSException *exception) {
//        ;
//    }
//    @finally {
//        [db close];
//        [TestDBUtil dropTmpDB:name];
//    }
//}
//
//-(void) testCommand
//{
//    NSString* name = [TestDBUtil getTmpDBName];
//    DSEngineSQLite* db = [[DSEngineSQLite alloc] initWithDBName:name];
//    STAssertNotNil(db, @"use ok");
//    STAssertNotNil([db getAbsolutePath], @"db's absolute path");
//    NSLog(@"%@", [db getAbsolutePath]);
//    
//    [db open];
//    @try {
//        NSString* sql = @"create table hoge (id integer primary key);";
//        STAssertNoThrow([db command:sql WithParam:@{}], @"command ok");
//    }
//    @catch (NSException *exception) {
//        ;
//    }
//    @finally {
//        [db close];
//        [TestDBUtil dropTmpDB:name];
//    }
//}

@end
