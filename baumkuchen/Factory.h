//
//  FactoryComponent.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DomainData.h"

// ImplClass should be implement in DataSource layer
// because that implementation would be bound with datasource specs.

@protocol Factory <NSObject>

-(id<DomainData>) create;

@end

