//
//  Validator.h
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataType : NSObject

@property (nonatomic, retain) NSDictionary* format;

-(void) require:(NSString*)key ToBe:(DataType*)type;
-(void) optional:(NSString*)key ToBe:(DataType*)type;

-(BOOL) validate:(NSDictionary*)params;

@end
