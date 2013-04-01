//
//  Factory.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FactoryComponent.h"
#import "DomainData.h"

@interface Factory : NSObject


-(id) initWithComponent:(id<FactoryComponent>)component;
-(id<DomainData>) create;
-(void) drop:(id<DomainData>)domainData;

@end
