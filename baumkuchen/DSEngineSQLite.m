//
//  DSEngine.m
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/10/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "DSEngineSQLite.h"

@interface DSEngineSQLite()

@property (atomic, retain) NSString* absolutePath;
@property (atomic, retain) FMDatabase* dataSource;

@end

@implementation DSEngineSQLite

- (id) initWithDBName:(NSString *)dbFileName
{
    if (self == [super init]) {
        NSArray* paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* dir = [paths objectAtIndex:0];
        
        BOOL isDirExist;
        [[NSFileManager defaultManager] fileExistsAtPath:dir isDirectory:&isDirExist];
        if (!isDirExist){
            dir = NSTemporaryDirectory();
        }
        NSString* dbPath = [dir stringByAppendingPathComponent:dbFileName];

        self.absolutePath = dbPath;
    }
    
    return self;
}

-(NSString*) getAbsolutePath
{
    return [self absolutePath];
}

- (void) open
{
    if ([self dataSource] == Nil) {
        if (![self absolutePath]) {
            [NSException raise:@"DB file name was not found." format:@""];
        }
        self.dataSource = [FMDatabase databaseWithPath:[self absolutePath]];
    }

    [[self dataSource] open];
}

- (void) close
{
    [[self dataSource] close];
}

-(void) begin
{
    [[self dataSource] beginTransaction];
}

-(void) commit
{
    [[self dataSource] commit];
}

-(void) rollback
{
    [[self dataSource] rollback];
}


- (BOOL) command:(NSString*)sql WithParam:(NSDictionary*)param
{
    BOOL result = [[self dataSource] executeUpdate:sql withParameterDictionary:param];
    if (result != TRUE) {
        NSString* errorMessage = [[self dataSource] lastErrorMessage];
        [NSException raise:@"DataCommandException" format:@"Requested command has failed. Cause:%@", errorMessage];
    }
    return result;
}

- (NSArray*) query:(NSString*)sql WithParam:(NSDictionary*)param
{
    
    NSMutableArray * result = [NSMutableArray array];
    FMResultSet* rs = [[self dataSource] executeQuery:sql withParameterDictionary:param];
    if (rs == Nil) {
        NSString* errorMessage = [[self dataSource] lastErrorMessage];
        [NSException raise:@"DataFetchException" format:@"Cause:%@", errorMessage];
    }

    while ([rs next]) {
        [result addObject:[rs resultDictionary]];
    }
    [rs close];
    
    return result;
}

@end
