//
//  CCAViewController.m
//  RadialGradientLayerSample
//
//  Created by Jean-Luc Dagon on 19/01/2014.
//  Copyright (c) 2014 Cocoapps. All rights reserved.
//

#import "CCAViewController.h"
#import "CCARadialGradientLayer.h"

@interface CCAViewController ()

@end

#define UIColorFromRGB(rgbValue) [UIColor \
    colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
    green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
    blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation CCAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CCARadialGradientLayer *radialGradientLayer = [CCARadialGradientLayer layer];
    radialGradientLayer.colors = @[
                                   (id)UIColorFromRGB(0xFFFECF).CGColor,
                                   (id)UIColorFromRGB(0xFEE57F).CGColor,
                                   (id)UIColorFromRGB(0xFED64D).CGColor,
                                   (id)UIColorFromRGB(0xFA9333).CGColor,
                                   ];
    radialGradientLayer.locations = @[@0, @0.3, @0.5, @1];
    radialGradientLayer.gradientOrigin = CGPointMake(160, 134);
    radialGradientLayer.gradientRadius = 245;
    
    radialGradientLayer.frame = self.view.layer.bounds;
    [self.view.layer addSublayer:radialGradientLayer];
    
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [CATransaction begin];
        [CATransaction setAnimationDuration:2];
        
        radialGradientLayer.colors = @[
                                       (id)UIColorFromRGB(0xFA9333).CGColor,
                                       (id)UIColorFromRGB(0xFED64D).CGColor,
                                       (id)UIColorFromRGB(0xFEE57F).CGColor,
                                       (id)UIColorFromRGB(0xFFFECF).CGColor,
                                       ];
        radialGradientLayer.gradientOrigin = CGPointMake(160, 334);
        radialGradientLayer.gradientRadius = 120;
        
        [CATransaction commit];
        
    });
}

@end
