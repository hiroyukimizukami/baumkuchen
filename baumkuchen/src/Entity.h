//
//  Entity.h
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/12/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject

@property (nonatomic, retain) NSNumber* primary;
@property (nonatomic, retain) NSNumber* createdAt;
@property (nonatomic, retain) NSNumber* updatedAt;

@end
