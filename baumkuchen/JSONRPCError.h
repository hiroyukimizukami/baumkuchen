//
//  JSONRPCError.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/22/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONRPCError <NSObject>

@property (nonatomic, strong) NSNumber* code;
@property (nonatomic, strong) NSString* message;
@property (nonatomic, strong) NSArray* data;

-(id) init;
-(id) initWithData:(NSArray*) dataArray;
-(id) initWithJSON:(NSString*) json;

@end
