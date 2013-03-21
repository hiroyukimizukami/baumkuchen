//
//  DSSQLiteEngine.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/17/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "DSSQLiteEngineTest.h"
#import "DSEngineSQLite.h"

@implementation DSSQLiteEngineTest

-(void) testConnection
{
    long nowLong = [[NSDate date] timeIntervalSince1970];
    int rand = arc4random() % 999;
    
    NSString* name = [[NSString stringWithFormat:@"%ld", nowLong] stringByAppendingString:[NSString stringWithFormat:@"%d", rand]];
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];

    DSEngineSQLite* db = [[DSEngineSQLite alloc] initWithDBName:name];
    STAssertNotNil(db, @"use ok");
    STAssertNotNil([db getAbsolutePath], @"db's absolute path");
    
    [db close];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL success = [fileManager removeItemAtPath:name error:NULL];
    NSLog(@"%i", success);


}

@end
