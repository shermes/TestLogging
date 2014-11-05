//
//  CoreLogger.h
//  TestLogger
//
//  Created by Scott Hermes on 10/13/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
// Only log errors in production
#ifdef DEBUG
static int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static int ddLogLevel = LOG_LEVEL_ERROR;
#endif

// helpful marcos
#define NCLog(s, ...) NSLog(@"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], \
__LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define LOG_CLASS_AND_METHOD_NAME()  NSLog(@"%@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
// #define NTLogVerbose(s) [CoreLogger NTLogVerbose:s]
#define NTLogVerbose(fmt,...) [CoreLogger NTLogVerbose:fmt, ## __VA_ARGS__]

/**
 Options for enabling loggers at init
 */
typedef NS_OPTIONS(NSUInteger, LoggerToInitialize) {
    InitializeLoggerNone        = 0,
    InitializeLoggerDegugWindow = 1 << 0,
    InitializeLoggerSystemLog   = 1 << 1,
    InitializeLoggerFile        = 1 << 2,
    InitializeLoggerCrashlytics = 1 << 3
};
@interface CoreLogger : NSObject
/**
        Initialize all loggers
 */
+ (void) initLogging;
/**
        Initialize selected loggers
*/
+ (void) initLogging:(LoggerToInitialize) loggersToInitialize;
/**
Log a verbose message
 */
+ (void) NTLogVerbose:(NSString *)fmt, ... ;
/**
 Log an error message
 */
+ (void) NTLogError:(NSString *)msg;

@end
