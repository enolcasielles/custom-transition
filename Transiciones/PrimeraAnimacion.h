//
//  CTSSimpleTransition.h
//  CustomTransitionSample
//
//  Created by MIGUEL DIAZ RUBIO on 19/01/14.
//  Copyright (c) 2014 MIGUELDIAZRUBIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PrimeraAnimacion : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval timeAnimation;
@property (nonatomic, assign) BOOL isShowing;

@end
