//
//  ViewController.m
//  TestLogger
//
//  Created by Scott Hermes on 10/13/14.
//  Copyright (c) 2014 Solstice. All rights reserved.
//

#import "ViewController.h"
#import <CocoaLumberjack.h>
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)buttonClick:(id)sender {
    // Call once
    [CoreLogger NTLogError:@"This is an error"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
