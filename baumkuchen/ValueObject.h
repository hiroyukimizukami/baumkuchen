//
//  ValueObject.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 4/12/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DomainData.h"

@protocol ValueObject <DomainData>

@property (strong, readonly, nonatomic) NSNumber* primary;
@property (strong, readonly, nonatomic) NSString* value;
@property (strong, readonly, nonatomic) NSString* createdAt;

@end
