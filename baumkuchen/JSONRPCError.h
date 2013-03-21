//
//  CommonJSONRPCError.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/20/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONRPCError : NSObject

@property (nonatomic, strong) NSNumber* code;
@property (nonatomic, strong) NSString* message;
@property (nonatomic, strong) NSArray* data;

-(id) initWithCode:(NSNumber*)code AndMessage:(NSString*)message AndData:(NSArray*)data;

-(NSDictionary*) build;

@end
