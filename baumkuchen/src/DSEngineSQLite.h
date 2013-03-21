//
//  DSEngine.h
//  CyuniGenerator
//
//  Created by hiroyuki.mizukami on 3/10/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSEngine.h"
#import "FMDatabase.h"

@interface DSEngineSQLite : NSObject <DSEngine>

-(id) initWithDBName:(NSString*) dbFileName;
-(NSString*) getAbsolutePath;

-(void) dealloc;

@end