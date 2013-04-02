//
//  DataSource.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/17/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

-(id) initWithEngine:(id<DSEngine>)engine
{
    if(self == [super init]) {
        self.engine = engine;
    }
    
    return self;
}

-(void) open
{
    [[self engine] open];
}

-(void) close
{
    [[self engine] close];
}

-(void) begin
{
    [[self engine] close];
}

-(void) commit
{
    [[self engine] commit];
}

-(void) rollback
{
    [[self engine] rollback];
}

-(BOOL) command:(NSString *)sql WithParam:(NSDictionary *)param
{
    return [[self engine] command:sql WithParam:param];

}

-(NSArray*) query:(NSString *)sql WithParam:(NSDictionary *)param
{
    return [[self engine] query:sql WithParam:param];
}

@end
