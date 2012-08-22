//
//  Konjure.m
//  Konjure
//
//  Created by Michael Harrington on 8/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Konjure.h"

@implementation Konjure

@end

BOOL konjure_replaceMethod0(Class cls, SEL name, id (^block)(id), char *types)
{
  IMP imp = imp_implementationWithBlock(block);
  return class_replaceMethod(cls, name, imp, types) != NULL;
}

BOOL konjure_replaceMethod1(Class cls, SEL name, id (^block)(id, id), char *types)
{
  IMP imp = imp_implementationWithBlock(block);
  return class_replaceMethod(cls, name, imp, types) != NULL;
}

BOOL konjure_replaceMethod2(Class cls, SEL name, id (^block)(id, id, id), char *types)
{
  IMP imp = imp_implementationWithBlock(block);
  return class_replaceMethod(cls, name, imp, types) != NULL;
}

BOOL konjure_replaceMethod3(Class cls, SEL name, id (^block)(id, id, id, id), char *types)
{
  IMP imp = imp_implementationWithBlock(block);
  return class_replaceMethod(cls, name, imp, types) != NULL;
}

BOOL konjure_replaceMethod4(Class cls, SEL name, id (^block)(id, id, id, id, id), char *types)
{
  IMP imp = imp_implementationWithBlock(block);
  return class_replaceMethod(cls, name, imp, types) != NULL;
}

NSString *konjure_foo()
{
  return @"bax";
}