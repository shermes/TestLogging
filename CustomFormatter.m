//
//  CustomFormatter.m
//  TestLogger
//
//  Created by Scott Hermes on 10/14/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#import "CustomFormatter.h"
NSDateFormatter *threadUnsafeDateFormatter;

@implementation CustomFormatter
- (id)init
{
    if((self = [super init]))
    {
        threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
        [threadUnsafeDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [threadUnsafeDateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss:SSS"];
    }
    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel;
    switch (logMessage->logFlag)
    {
        case LOG_FLAG_ERROR : logLevel = @"#error"; break;
        case LOG_FLAG_WARN  : logLevel = @"#warning"; break;
        case LOG_FLAG_INFO  : logLevel = @"#info"; break;
        case LOG_FLAG_DEBUG : logLevel = @"#debug"; break;
        default             : logLevel = @"#verbose"; break;
    }
    NSString *dateAndTime = [threadUnsafeDateFormatter stringFromDate:(logMessage->timestamp)];

    return [NSString stringWithFormat:@"%@|%@|%@\n", dateAndTime, logLevel, logMessage->logMsg];
}

@end
