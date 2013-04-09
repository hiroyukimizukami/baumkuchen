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
    if (![self inspector]) {
        return TRUE;
    }
    
    NSEnumerator* e = [[self selectors] objectEnumerator];
    id element;
    while(element = [e nextObject]) {
        NSString* selectorName = element;
        SEL selector = NSSelectorFromString(selectorName);

        if (![[self inspector] respondsToSelector:selector]) {
            continue;
        }
        [[self inspector] performSelector:selector withObject:@[sql, param]];
    }
    
    return TRUE;
}

- (NSArray*) query:(NSString*)sql WithParam:(NSDictionary*)param
{
    if (![self inspector]) {
        return [self mockedResult];
    }
    
    NSEnumerator* e = [[self selectors] objectEnumerator];
    id element;
    while(element = [e nextObject]) {
        NSString* selectorName = element;
        SEL selector = NSSelectorFromString(selectorName);
        
        if (![[self inspector] respondsToSelector:selector]) {
            continue;
        }
        [[self inspector] performSelector:selector withObject:@[sql, param]];
    }
    
    return [self mockedResult];
    
}


@end

