//
//  MockDSEngineImpl.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 4/10/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "MockDSEngineImpl.h"

@implementation MockDSEngineImpl

-(void) open
{
    
}

-(void) close
{
    
}

-(void) begin{
    
}

-(void) commit
{
    
}

-(void) rollback
{
    
}

- (BOOL) command:(NSString*)sql WithParam:(NSDictionary*)param
{
    self.latestParams = @{@"sql" : sql, @"param" : param};
    return TRUE;
}

- (NSArray*) query:(NSString*)sql WithParam:(NSDictionary*)param
{

    self.latestParams = @{@"sql" : sql, @"param" : param};
    return [NSArray array];
}


@end

