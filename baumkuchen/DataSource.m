//
//  DataSource.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/17/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "DataSource.h"

@interface DataSource()

@property (nonatomic, assign) BOOL trunsaction;

@end

@implementation DataSource

-(id) initWithEngine:(id<DSEngine>)engine
{
    if(self == [super init]) {
        self.engine = engine;
    }
    
    return self;
}

-(NSDictionary*) selectOne:(NSString *)sql With:(NSNumber *)primary
{
    [self open];
    @try {
        NSDictionary* param = @{@"id" : primary};
        NSArray* result = [[self engine] query:sql WithParam:param];
        if ([result count] == 0) {
            return Nil;
        }
        return [result objectAtIndex:0];
    }
    @catch (NSException *exception) {
        [exception raise];
    }
    @finally {
        [self close];
    }
}

-(NSArray*) selectAll:(NSString *)sql
{
    [self open];
    @try {
        NSDictionary* param = @{};
        return [[self engine] query:sql WithParam:param];
    }
    @catch (NSException *exception) {
        [exception raise];
    }
    @finally {
        [self close];
    }
}

-(NSArray*) selectSome:(NSString *)sql With:(NSDictionary *)param
{
    [self open];
    @try {
        return [[self engine] query:sql WithParam:param];
    }
    @catch (NSException *exception) {
        [exception raise];
    }
    @finally {
        [self close];
    }
}


-(BOOL) update:(NSString *)sql With:(NSDictionary *)param
{
    return [self command:sql With:param];
}

-(BOOL) remove:(NSString *)sql With:(NSDictionary *)param
{
    return  [self command:sql With:param];
}

-(BOOL) insert:(NSString *)sql With:(NSDictionary *)param
{
    return [self command:sql With:param];
}

-(BOOL) command:(NSString*)sql With:(NSDictionary*)param
{
    [self open];
    @try {
        [[self engine] command:sql WithParam:param];
    }
    @catch (NSException *exception) {
        [exception raise];
    }
    @finally {
        [self close];
    }
}

-(void) open
{
    if ([self trunsaction]) {
        return ;
    }
    [[self engine] open];
}

-(void) close
{
    [[self engine] close];
    self.trunsaction = FALSE;
}

-(void) begin
{
    self.trunsaction = TRUE;
    [[self engine] begin];
}

-(void) commit
{
    if ([self trunsaction]) {
        [[self engine] commit];
    }
    self.trunsaction = FALSE;
}

-(void) rollback
{
    if ([self trunsaction]) {
        [[self engine] rollback];
    }
    self.trunsaction = FALSE;
}

@end
