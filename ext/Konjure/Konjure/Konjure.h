//
//  Konjure.h
//  Konjure
//
//  Created by Michael Harrington on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Konjure : NSObject

@end

BOOL konjure_replaceMethod0(Class cls, SEL name, id (^block)(id), char *types);
BOOL konjure_replaceMethod1(Class cls, SEL name, id (^block)(id, id), char *types);
BOOL konjure_replaceMethod2(Class cls, SEL name, id (^block)(id, id, id), char *types);
BOOL konjure_replaceMethod3(Class cls, SEL name, id (^block)(id, id, id, id), char *types);
BOOL konjure_replaceMethod4(Class cls, SEL name, id (^block)(id, id, id, id, id), char *types);
NSString *konjure_foo();