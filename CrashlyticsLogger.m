//
//  CrashlyticsLogger.m
//  TestLogger
//
//  Created by Scott Hermes on 10/14/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#import "CrashlyticsLogger.h"
#import <Crashlytics/Crashlytics.h>

@implementation CrashlyticsLogger

- (void)logMessage:(DDLogMessage *)msg{
    NSString *logMsg = msg->logMsg;
    
    if (logMsg )
    {
        if (formatter)
        {
            logMsg = [formatter formatLogMessage:msg];
        }
        CLSLog(@"%@",logMsg);
    }
    return;
}

@end