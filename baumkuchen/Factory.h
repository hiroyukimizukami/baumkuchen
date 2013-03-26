//
//  Factory.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FactoryComponent.h"
#import "Entity.h"

@interface Factory : NSObject


-(id) initWithComponent:(id<FactoryComponent>)component;
-(id<Entity>) create;
-(void) drop:(id<Entity>)entity;

@end
