//
//  Entity.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DomainData.h"

@protocol Entity <DomainData>

@property (nonatomic, retain) NSNumber* primary;
@property (nonatomic, retain) NSNumber* createdAt;
@property (nonatomic, retain) NSNumber* updatedAt;

@end
