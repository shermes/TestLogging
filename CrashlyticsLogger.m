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
- (CrashlyticsLogger *) init{
    self = [super init];
    [Crashlytics startWithAPIKey:@"a12568c0b92f1f19a8e79e4187c23ca28bacfec3"];
    return self;
}

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