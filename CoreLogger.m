//
//  CoreLogger.m
//  TestLogger
//
//  Created by Scott Hermes on 10/13/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#import "CoreLogger.h"
#import "CustomFormatter.h"
static NSString *appTag = @"#PP7";
static NSString *verboseTag = @"#verbose";
static NSString *errorTag = @"#error";
@implementation CoreLogger
+ (void) initLogging{
    // Always log to system console
    [DDLog addLogger:[DDASLLogger sharedInstance]];
#ifdef DEBUG
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    // Initialize File Logger
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    // WARNING: formatter is not thread safe. If you want to reuse it, look at documentation on Github on Custom Formatters
    CustomFormatter *formatter = [[CustomFormatter alloc] init];
    
    // Configure File Logger
    [fileLogger setMaximumFileSize:(1024 * 1024)];
    //    [fileLogger setRollingFrequency:(3600.0 * 24.0)];
    [[fileLogger logFileManager] setMaximumNumberOfLogFiles:5];
    [fileLogger setLogFormatter:formatter];
    [DDLog addLogger:fileLogger];
#endif
}

+ (void) NTLogVerbose:(NSString *)msg{
//    DDLogVerbose(@"%@|%@|%@",appTag, verboseTag, msg);
    DDLogVerbose(msg);
}
+ (void) NTLogError:(NSString *)msg{
//    DDLogError(@"%@|%@|%@",appTag, errorTag, msg);
    DDLogError(msg);
}


@end
