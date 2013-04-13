//
//  TestDBUtil.h
//  baumkuchen
//
//  Created by hiroyuki.mizukami on 4/13/13.
//  Copyright (c) 2013 hiroyuki.mizukami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestDBUtil : NSObject

+(NSString*)getTmpDBName;
+(void)dropTmpDB:(NSString*)name;

@end
