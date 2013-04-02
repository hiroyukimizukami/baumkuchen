//
//  DSEngine.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 3/20/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DSEngine <NSObject>
-(void) open;
-(void) close;
-(void) begin;
-(void) commit;
-(void) rollback;
- (BOOL) command:(NSString*)sql WithParam:(NSDictionary*)param;
- (NSArray*) query:(NSString*)sql WithParam:(NSDictionary*)param;
@end
