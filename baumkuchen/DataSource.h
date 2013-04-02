//
//  DataSource.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/17/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSEngine.h"

@interface DataSource : NSObject

@property (nonatomic, strong) id<DSEngine> engine;

-(id) initWithEngine:(id<DSEngine>) engine;
-(void) open;
-(void) close;
-(void) begin;
-(void) commit;
-(void) rollback;
- (BOOL) command:(NSString*)sql WithParam:(NSDictionary*)param;
- (NSArray*) query:(NSString*)sql WithParam:(NSDictionary*)param;


@end
