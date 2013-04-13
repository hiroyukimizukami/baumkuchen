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


//TODO
// XXX ... primitive IF it contains command ,query and primitive DCL.
// DataSource ... public IF thus it should contains crud and select(one|all|parend|root)
@property (nonatomic, strong) id<DSEngine> engine;

-(id) initWithEngine:(id<DSEngine>) engine;
-(NSDictionary*)selectOne:(NSString*)sql With:(NSNumber*)primary;
-(NSArray*) selectAll:(NSString*)sql;
-(NSArray*) selectSome:(NSString*)sql With:(NSDictionary*)param;
-(BOOL) update:(NSString*)sql With:(NSDictionary*)param;
-(BOOL) remove:(NSString*)sql With:(NSDictionary*)param;
-(BOOL) insert:(NSString*)sql With:(NSDictionary*)param;

-(void) open;
-(void) close;
-(void) begin;
-(void) commit;
-(void) rollback;

@end
