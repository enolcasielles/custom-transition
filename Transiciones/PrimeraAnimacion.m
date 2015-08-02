//
//  CTSSimpleTransition.m
//  CustomTransitionSample
//
//  Created by MIGUEL DIAZ RUBIO on 19/01/14.
//  Copyright (c) 2014 MIGUELDIAZRUBIO. All rights reserved.
//

#import "PrimeraAnimacion.h"

@implementation PrimeraAnimacion

-(id)init{
    if (self = [super init]) {
        self.timeAnimation = 1.0;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.timeAnimation;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if(self.isShowing) {
        [self showingAnimation:transitionContext];
    }
    else{
        [self dismissAnimation:transitionContext];
    }
}

-(void)showingAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //Recuperamos el sandbox en el que se producira la animacion
    UIView *inView = [transitionContext containerView];
    
    //Recuperamos los controladores de entrada y salida
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //Colocamos el controlador que entra por encima
    [inView insertSubview:toViewController.view aboveSubview:fromViewController.view];

    //Lo situamos en la parte inferior de la pantalla
    toViewController.view.frame = CGRectMake(0, inView.frame.size.height, inView.frame.size.width, inView.frame.size.height);

    //Iniciamos una animacion desde la anterior posicion hasta la posicion correcta, cuando finalice avisamos al objeto delegado que nos evnia el sistema
    [UIView animateWithDuration:self.timeAnimation delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        toViewController.view.frame = CGRectMake(0, 0, inView.frame.size.width, inView.frame.size.height);
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];

}


//Metodo de animacion para salida, muy similar al anterior pero con el efecto de animacion opuesto
-(void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *inView = [transitionContext containerView];
    
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [inView insertSubview:toViewController.view belowSubview:fromViewController.view];

    [UIView animateWithDuration:self.timeAnimation delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        fromViewController.view.frame = CGRectMake(0, inView.frame.size.height, inView.frame.size.width, inView.frame.size.height);
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

@end
