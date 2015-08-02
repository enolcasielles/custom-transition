//
//  ViewController.h
//  Transiciones
//
//  Created by System Administrator on 7/22/15.
//  Copyright (c) 2015 Maetrik Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrimeraAnimacion.h"
#import "CEFoldAnimationController.h"
#import "CECardsAnimationController.h"

@interface ViewController : UIViewController 

//Declaramos como propiedades los distintos objetos animators
@property(nonatomic,strong) PrimeraAnimacion *primeraAnimacion;
@property(nonatomic,strong) CECardsAnimationController *segundaAnimacion;
@property(nonatomic,strong) CEFoldAnimationController *terceraAnimacion;

@end

