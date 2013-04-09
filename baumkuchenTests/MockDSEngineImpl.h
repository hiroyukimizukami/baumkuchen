//
//  MockDSEngineImpl.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 4/10/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSEngine.h"

@interface MockDSEngineImpl : NSObject<DSEngine>

@property (weak, nonatomic) id inspector;
@property (weak, nonatomic) NSArray* selectors;
@property (weak, nonatomic) id mockedResult;

@end
