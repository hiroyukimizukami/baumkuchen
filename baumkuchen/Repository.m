//
//  Repository.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "Repository.h"
#import "RepositoryComponent.h"
#import "DomainData.h"

@interface Repository()

@property (strong, nonatomic) id<RepositoryComponent> component;

@end

@implementation Repository

-(id) initWithComponent:(id<RepositoryComponent>)component
{
    if (self == [super init]) {
        self.component = component;
    }
    
    return self;
}

-(id<DomainData>) lookup:(NSNumber*)primary
{
    return [[self component] lookup:primary];
}

-(NSArray*) find
{
    return [[self component] find];
}

-(void) store:(id<DomainData>)domainData;
{
    [[self component] store:domainData];
}

@end