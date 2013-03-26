//
//  Repository.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "Repository.h"
#import "RepositoryComponent.h"
#import "Entity.h"

@interface Repository()

@property (strong, nonatomic) id<RepositoryComponent> component;

@end

@implementation Repository

-(id<Entity>) lookup:(NSNumber*)entity
{
    
}

@end
