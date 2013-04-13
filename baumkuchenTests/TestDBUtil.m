//
//  TestDBUtil.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 4/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "TestDBUtil.h"

@implementation TestDBUtil

+(NSString*) getTmpDBName
{
    long nowLong = [[NSDate date] timeIntervalSince1970];
    int rand = arc4random() % 999;
    NSString* prefix = @"tmp";
    NSString* appendix = @".db";
    
    NSString* name = [[NSString stringWithFormat:@"%ld", nowLong] stringByAppendingString:[NSString stringWithFormat:@"%d", rand]];
    
    return [prefix stringByAppendingString:[name stringByAppendingString:appendix]];
}

+(void) dropTmpDB:(NSString*)name
{
    @synchronized([self class]) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL success = [fileManager removeItemAtPath:name error:NULL];
        NSLog(@"%i", success);
    }
}

@end
