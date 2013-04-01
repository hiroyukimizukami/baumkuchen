//
//  Repository.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/27/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryComponent.h"
#import "DomainData.h"

@interface Repository : NSObject

-(id) initWithComponent:(id<RepositoryComponent>)component;
-(id<DomainData>) lookup:(NSNumber*)primary;
-(NSArray*) find;
-(void) store:(id<DomainData>)DomainData;

@end
