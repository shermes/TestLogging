//
//  ViewController.m
//  TestLogger
//
//  Created by Scott Hermes on 10/13/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#import "ViewController.h"
#import <CocoaLumberjack.h>
#import <Crashlytics/Crashlytics.h>
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)buttonClick:(id)sender {
    // Call class without using macro
    [CoreLogger NTLogError:@"This is an error"];
    // Calling crashlytics logging directly
    CLSLog(@"This is a message from CLSLog");
    // Call crashlytics log that also calls NS log
    CLSNSLog(@"This is a message from CLS NS Log");
    // NCLOG will also print filename and line #
    NCLog(@"This is NCLOG");
    // Call NT Logger via macro
    NTLogVerbose(@"Test of NT Log macro %@", @"does this appear");
    // Macro that logs class and methods name
    LOG_CLASS_AND_METHOD_NAME();
    // force a crash
    [[Crashlytics sharedInstance] crash];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [CoreLogger NTLogVerbose:@"This is JUST A MESSAGE"];
    // NSError* error;
    NSString *employeeJSONPath = [[NSBundle mainBundle] pathForResource:@"offlineUserLayouts" ofType:@"json"];
    NSString *employeeJSON = [NSString stringWithContentsOfFile:employeeJSONPath encoding:NSUTF8StringEncoding error:NULL];
//    NSData *data = [employeeJSON dataUsingEncoding:NSUTF8StringEncoding];
    [CoreLogger NTLogVerbose:employeeJSON];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
