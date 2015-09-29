//
//  L3SDKParallaxLayer.h
//  iOS-Parallax-Layer-Maker
//
//  Created by Domenico Vacchiano on 29/09/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    L3SDKParallaxLayerScrollDirectionUp,
    L3SDKParallaxLayerScrollDirectionDown,
    L3SDKParallaxLayerScrollDirectionRight,
    L3SDKParallaxLayerScrollDirectionLeft
} L3SDKParallaxLayerScrollDirection;

@interface L3SDKParallaxLayer : UIView

//local property to store the image name
@property (nonatomic,strong,readonly)NSString*imageName;
//local property to store the scroll direction
@property (nonatomic,assign,readonly)L3SDKParallaxLayerScrollDirection scrollDirection;
//local property to store the scroll speed
@property (nonatomic,assign,readonly)float scrollSpeed;

//initialization factory methods
-(instancetype)initWithFrame:(CGRect)frame
                andImageName:(NSString*)imageName
          andScrollDirection: (L3SDKParallaxLayerScrollDirection)scrollDirection
              andScrollSpeed:(float)scrollSpeed;

-(instancetype)initWithFrame:(CGRect)frame
                andImageName:(NSString*)imageName
          andScrollDirection: (L3SDKParallaxLayerScrollDirection)scrollDirection
              andScrollSpeed:(float)scrollSpeed
                 andAutoPlay:(BOOL)autoPlay;


-(void)play;
-(void)stop;
@end
