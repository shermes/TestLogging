//
//  CoreLogger.m
//  TestLogger
//
//  Wrapper class for CocoaLumberjack
//  Created by Scott Hermes on 10/13/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#import "CoreLogger.h"
#import "CustomFormatter.h"
#import "CrashlyticsLogger.h"
@implementation CoreLogger
+ (void) initLogging{
    [self initLogging:(InitializeLoggerCrashlytics | InitializeLoggerDegugWindow | InitializeLoggerFile| InitializeLoggerSystemLog)];
}
+ (void) initLogging:(LoggerToInitialize) loggersToInitialize{
    
    // Always log to system console
    if (loggersToInitialize & InitializeLoggerSystemLog) {
        [DDLog addLogger:[DDASLLogger sharedInstance]];
    }
#ifdef DEBUG
    if (loggersToInitialize & InitializeLoggerDegugWindow) {
        [DDLog addLogger:[DDTTYLogger sharedInstance]];
    }
    // Initialize File Logger
    if (loggersToInitialize & InitializeLoggerSystemLog) {
        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
        // WARNING: formatter is not thread safe. If you want to reuse it, look at documentation on Github on Custom Formatters
        CustomFormatter *formatter = [[CustomFormatter alloc] init];
            
        // Configure File Logger
        [fileLogger setMaximumFileSize:(1024 * 1024)];
        //    [fileLogger setRollingFrequency:(3600.0 * 24.0)];
        [[fileLogger logFileManager] setMaximumNumberOfLogFiles:5];
        [fileLogger setLogFormatter:formatter];
        [DDLog addLogger:fileLogger];
    }
    if (loggersToInitialize & InitializeLoggerCrashlytics) {
        [DDLog addLogger:[[CrashlyticsLogger alloc] init] ];
    }
#endif
    
}

//+ (void) NTLogVerbose:(NSString *)msg{
//    DDLogVerbose(msg);
//}
+ (void) NTLogVerbose:(NSString *)fmt, ...{
    va_list args;
    if (fmt) {
        va_start(args, fmt);
        NSString *logMsg = [[NSString alloc] initWithFormat:fmt arguments:args];
        va_end(args);
        DDLogVerbose(logMsg);
    }
}

+ (void) NTLogError:(NSString *)msg{
    DDLogError(msg);
}


@end
