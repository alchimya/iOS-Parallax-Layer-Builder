//
//  ViewController.m
//  iOS-Parallax-Layer-Builder
//
//  Created by Domenico Vacchiano on 29/09/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"

#import "ViewController.h"
#import "L3SDKParallaxLayer.h"

@interface ViewController ()
//L3SDKParallaxLayer instances
@property (nonatomic,strong)L3SDKParallaxLayer*backgroundLayer;
@property (nonatomic,strong)L3SDKParallaxLayer*foregroundLayer;
@property (nonatomic,strong)L3SDKParallaxLayer*middleLayer;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    //creates three parallax layers:background, midle and foreground
    self.backgroundLayer=[[L3SDKParallaxLayer alloc] initWithFrame:self.view.bounds
                                                      andImageName:@"Sky_back_layer.png"
                                                andScrollDirection:L3SDKParallaxLayerScrollDirectionLeft
                                                    andScrollSpeed:35.0];
    
    self.middleLayer=[[L3SDKParallaxLayer alloc] initWithFrame:self.view.bounds
                                                  andImageName:@"Vegetation_middle_layer.png"
                                            andScrollDirection:L3SDKParallaxLayerScrollDirectionLeft
                                                andScrollSpeed:15.0];
    
    self.foregroundLayer=[[L3SDKParallaxLayer alloc] initWithFrame:self.view.bounds
                                                      andImageName:@"Ground_front_layer.png"
                                                andScrollDirection:L3SDKParallaxLayerScrollDirectionLeft
                                                    andScrollSpeed:1.5];
     
     [self.view addSubview:self.backgroundLayer];
     [self.view addSubview:self.middleLayer];
     [self.view addSubview:self.foregroundLayer];
     

    
    /*
     //VERTICAL SCROLL
    //creates three parallax layers:background, midle and foreground
    self.backgroundLayer=[[L3SDKParallaxLayer alloc] initWithFrame:self.view.bounds
                                                      andImageName:@"v_sky.png"
                                                andScrollDirection:L3SDKParallaxLayerScrollDirectionDown
                                                    andScrollSpeed:35.0];
    
    self.foregroundLayer=[[L3SDKParallaxLayer alloc] initWithFrame:self.view.bounds
                                                      andImageName:@"v_foreground.png"
                                                andScrollDirection:L3SDKParallaxLayerScrollDirectionDown
                                                    andScrollSpeed:1.5];
    
    
    [self.view addSubview:self.backgroundLayer];
    [self.view addSubview:self.middleLayer];
    [self.view addSubview:self.foregroundLayer];
    */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end


