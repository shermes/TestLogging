//
//  CoreLogger.h
//  TestLogger
//
//  Created by Scott Hermes on 10/13/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack.h>
// Only log errors in production
#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif

@interface CoreLogger : NSObject
+ (void) initLogging;
+ (void) NTLogVerbose:(NSString *)msg;
+ (void) NTLogError:(NSString *)msg;

@end
