//
//  Repository.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryComponent.h"
#import "Entity.h"

@interface Repository : NSObject

-(id) initWithComponent:(id<RepositoryComponent>)component;
-(id<Entity>) lookup:(NSNumber*)entity;
-(id<Entity>) find;
-(id<Entity>) findChildsOf:(NSNumber*)parent;
-(void) store:(id<Entity>)entity;

@end
