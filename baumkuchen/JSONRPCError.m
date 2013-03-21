//
//  CommonJSONRPCError.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/20/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "JSONRPCError.h"

@implementation JSONRPCError

-(id) initWithCode:(NSNumber*)code AndMessage:(NSString*)message AndData:(NSArray*)data
{
    if (self == [super init]) {
        self.code = code;
        self.message = message;
        self.data = data; //it can be omitted.
        
    }
    
    return self;
}

-(NSDictionary*) build
{
    NSArray* data = [self data];
    if (data == Nil) {
        data = [NSArray array];
    }
    NSMutableDictionary* result = [NSMutableDictionary dictionary];
    [result setObject:[self code] forKey:@"code"];
    [result setObject:[self message] forKey:@"message"];
    [result setObject:data forKey:@"data"];
    
    return result;
}

@end
