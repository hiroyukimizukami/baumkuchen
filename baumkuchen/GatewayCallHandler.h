//
//  GatewayCallHandler.h
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 2/15/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GatewayCallHandler : NSObject

@property (atomic, retain) NSArray* inputFormat;
@property (atomic, retain) NSArray* outputFormat;

-(NSDictionary*) call:(NSDictionary*) input;

@end
