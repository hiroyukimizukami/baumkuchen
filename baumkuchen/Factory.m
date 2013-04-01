//
//  Factory.m
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import "Factory.h"
#import "FactoryComponent.h"

@interface Factory()

@property (strong, nonatomic) id<FactoryComponent> component;

@end

@implementation Factory

-(id) initWithComponent:(id<FactoryComponent>)component
{
    if (self == [super init]) {
        self.component = component;
    }
    
    return self;
}

-(id<DomainData>) create
{
    return [[self component] create];
}

-(void) drop:(id<DomainData>)domainData
{
    [[self component] drop:domainData];
}

@end
