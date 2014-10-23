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
    // Call once
    [CoreLogger NTLogError:@"This is an error"];
    CLSLog(@"This is a message from CLSLog");
    CLSNSLog(@"This is a message from CLS NS Log");
    [[Crashlytics sharedInstance] crash];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Crashlytics startWithAPIKey:@"a12568c0b92f1f19a8e79e4187c23ca28bacfec3"];
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
