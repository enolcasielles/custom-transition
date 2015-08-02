//
//  CTSSecondViewController.m
//  CustomTransitionSample
//
//  Created by MIGUEL DIAZ RUBIO on 18/01/14.
//  Copyright (c) 2014 MIGUELDIAZRUBIO. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () 
@end

@implementation SecondViewController

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
