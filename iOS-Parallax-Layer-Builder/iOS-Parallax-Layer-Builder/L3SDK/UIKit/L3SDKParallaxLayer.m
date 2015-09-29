//
//  L3SDKParallaxLayer.m
//  iOS-Parallax-Layer-Maker
//
//  Created by Domenico Vacchiano on 29/09/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKParallaxLayer.h"

@interface L3SDKParallaxLayer ()

-(void)buildLayer;
//local property to store the scrolling state (play/stop)
@property (nonatomic,assign)BOOL isPlaying;
-(CGRect)getTwinImageViewRect;
-(CGRect)getScrollingAnimationRect;
-(void)scroll;
@end

@implementation L3SDKParallaxLayer


-(instancetype)initWithFrame:(CGRect)frame
                andImageName:(NSString*)imageName
          andScrollDirection: (L3SDKParallaxLayerScrollDirection)scrollDirection
              andScrollSpeed:(float)scrollSpeed{

    return [self initWithFrame:frame andImageName:imageName
            andScrollDirection:scrollDirection
                andScrollSpeed:scrollSpeed
                   andAutoPlay:YES];

}

-(instancetype)initWithFrame:(CGRect)frame
                andImageName:(NSString*)imageName
          andScrollDirection: (L3SDKParallaxLayerScrollDirection)scrollDirection
              andScrollSpeed:(float)scrollSpeed
                 andAutoPlay:(BOOL)autoPlay{


    self=[super initWithFrame:frame];
    if (self) {
        //properties init
        self.isPlaying=autoPlay;
        
        _imageName=imageName;
        _scrollDirection=scrollDirection;
        _scrollSpeed=scrollSpeed;
        [self buildLayer];
        if (autoPlay) {
            //start scrolling
            [self scroll];
        }

    }
    
    return self;

}

-(void)buildLayer{

    //makes a layer with two UIIMageView.
    //When the first image will disappear out of the screen
    //there is another ("twin")image visible, and the first will move on the "tail" of the current visible image
    
    UIImageView*imageView1=[[UIImageView alloc]initWithFrame:self.frame];
    imageView1.image=[UIImage imageNamed:self.imageName];
    
    UIImageView*imageView2=[[UIImageView alloc]initWithFrame:[self getTwinImageViewRect]];
    imageView2.image=imageView1.image;
    
    [self addSubview:imageView1];
    [self addSubview:imageView2];
    
}

-(CGRect)getTwinImageViewRect{

    //depending of the scroll direction
    //it makes a frame to "paste" the tiwn image on the tail of the first image
    
    //LEFT SCROLLING
    //  |-------------|-------------|
    //  |             |             |
    //  |             |             |
    //  | imageView1  |  imageView2 |
    //  |             |             |
    //  |             |             |
    //  |-------------|-------------|
    
    //RIGHT SCROLLING
    //  |-------------|-------------|
    //  |             |             |
    //  |             |             |
    //  | imageView2  |  imageView1 |
    //  |             |             |
    //  |             |             |
    //  |-------------|-------------|
    
    
    //UP SCROLLING
    //  |-------------|
    //  |             |
    //  |             |
    //  | imageView1  |
    //  |             |
    //  |             |
    //  |-------------|
    //  |-------------|
    //  |             |
    //  |             |
    //  | imageView2  |
    //  |             |
    //  |             |
    //  |-------------|
    
    //DOWN SCROLLING
    //  |-------------|
    //  |             |
    //  |             |
    //  | imageView2  |
    //  |             |
    //  |             |
    //  |-------------|
    //  |-------------|
    //  |             |
    //  |             |
    //  | imageView1  |
    //  |             |
    //  |             |
    //  |-------------|
    
    CGRect rect=CGRectZero;
    
    switch (self.scrollDirection) {
        case L3SDKParallaxLayerScrollDirectionRight:
            rect=CGRectMake(
                            -self.frame.size.width,
                            self.frame.origin.y,
                            self.frame.size.width,
                            self.frame.size.height);
            break;
        case L3SDKParallaxLayerScrollDirectionLeft:
            rect=CGRectMake(
                            self.frame.size.width,
                            self.frame.origin.y,
                            self.frame.size.width,
                            self.frame.size.height);
            break;
        case L3SDKParallaxLayerScrollDirectionUp:
            rect=CGRectMake(
                            self.frame.origin.x,
                            self.frame.size.height,
                            self.frame.size.width,
                            self.frame.size.height);
            break;
        case L3SDKParallaxLayerScrollDirectionDown:
            rect=CGRectMake(
                            self.frame.origin.x,
                            -self.frame.size.height,
                            self.frame.size.width,
                            self.frame.size.height);
            break;
        default:
            break;
    }
    
    return rect;

}

-(void)scroll{

    //makes a linear repeat animation
    //changing the self frame depending of the scroll direction (see getScrollingAnimationRect)
    [UIView animateWithDuration:self.scrollSpeed
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat
                     animations:^{
                         self.frame=[self getScrollingAnimationRect];
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

-(CGRect)getScrollingAnimationRect{

    CGRect rect=CGRectZero;
    
    switch (self.scrollDirection) {
        case L3SDKParallaxLayerScrollDirectionRight:
            rect=CGRectMake(
                            self.frame.size.width,
                            self.frame.origin.y,
                            self.frame.size.width,
                            self.frame.size.height);
            break;
        case L3SDKParallaxLayerScrollDirectionLeft:
            rect=CGRectMake(
                            -self.frame.size.width,
                            self.frame.origin.y,
                            self.frame.size.width,
                            self.frame.size.height);
            break;
        case L3SDKParallaxLayerScrollDirectionUp:
            rect=CGRectMake(
                            self.frame.origin.x,
                            -self.frame.size.height,
                            self.frame.size.width,
                            self.frame.size.height);
            break;
        case L3SDKParallaxLayerScrollDirectionDown:
            rect=CGRectMake(
                            self.frame.origin.x,
                            self.frame.size.height,
                            self.frame.size.width,
                            self.frame.size.height);
            break;
        default:
            break;
    }
    
    return rect;

}

-(void)play{
    //play/restart animation
    if (self.isPlaying) {
        return;
    }
    self.isPlaying=YES;
    [self resumeLayer:self.layer];
}
-(void)stop{
    //stop current animation
    if (self.isPlaying) {
        self.isPlaying=NO;
        [self pauseLayer:self.layer];
    }
}

/////////////////////////////////////////////////////////////////
//see
//https://developer.apple.com/library/ios/qa/qa1673/_index.html
-(void)pauseLayer:(CALayer*)layer{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}
-(void)resumeLayer:(CALayer*)layer{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}
/////////////////////////////////////////////////////////////////


@end
