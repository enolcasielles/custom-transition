//
//  ViewController.m
//  Transiciones
//
//  Created by System Administrator on 7/22/15.
//  Copyright (c) 2015 Maetrik Development. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

int animacion;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Inicimos los objetos con las animaciones
    self.primeraAnimacion = [[PrimeraAnimacion alloc] init];
    self.segundaAnimacion = [[CECardsAnimationController alloc] init];
    self.terceraAnimacion = [[CEFoldAnimationController alloc] init];
}



//Implementamos metodo que se llamara cuando se haya de producir una transicion y nos enviara el segue que la produce
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"transicion1"]) {
        SecondViewController *dest = (SecondViewController *)segue.destinationViewController;
        dest.transitioningDelegate = self;
        animacion = 1;
    }
    if ([segue.identifier isEqualToString:@"transicion2"]) {
        SecondViewController *dest = (SecondViewController *)segue.destinationViewController;
        dest.transitioningDelegate = self;
        animacion = 2;
    }
    if ([segue.identifier isEqualToString:@"transicion3"]) {
        SecondViewController *dest = (SecondViewController *)segue.destinationViewController;
        dest.transitioningDelegate = self;
        animacion = 3;
    }
    
    [super prepareForSegue:segue sender:sender];
    
}




-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    if (animacion == 1) {
        self.primeraAnimacion.isShowing = YES;
        return self.primeraAnimacion;
    }

    
    else if (animacion == 2) {
        self.segundaAnimacion.reverse = YES;
        return self.segundaAnimacion;
    }

    //Si llega aqui sera que es la tercera animacion
    self.terceraAnimacion.reverse = YES;
    return self.terceraAnimacion;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    if (animacion == 1) {
        self.primeraAnimacion.isShowing = NO;
        return self.primeraAnimacion;
    }
    
    
    else if (animacion == 2) {
        self.segundaAnimacion.reverse = NO;
        return self.segundaAnimacion;
    }
    
    //Si llega aqui sera que es la tercera animacion
    self.terceraAnimacion.reverse = NO;
    return self.terceraAnimacion;
    
}


@end












