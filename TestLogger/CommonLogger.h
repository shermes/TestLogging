//
//  CommonLogger.h
//  TestLogger
//
//  Created by Scott Hermes on 10/13/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#ifndef TestLogger_CommonLogger_h
#define TestLogger_CommonLogger_h
# import <CocoaLumberjack.h>
#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif

#endif
