# iOS-Parallax-Layer-Builder
With this class you can build Images Scrollable Layers, to implement a parallax system (horizontal and vertical), where each layer can scroll to an indipendent direction.

![ScreenShot](https://raw.github.com/alchimya/iOS-Parallax-Layer-Builder/master/screenshots/iOS-Parallax-Layer-Builder.gif)

# How to use
Within this project/tutorial you will find a class (<b>L3SDKParallaxLayer</b>, UIView sublass) that allow to create a scrollable image layer to use as a layer of a parallax system.
<br/>
To create a layer you can use one of the following factory methods:
```objectivec

-(instancetype)initWithFrame:(CGRect)frame
                andImageName:(NSString*)imageName
          andScrollDirection: (L3SDKParallaxLayerScrollDirection)scrollDirection
              andScrollSpeed:(float)scrollSpeed;

-(instancetype)initWithFrame:(CGRect)frame
                andImageName:(NSString*)imageName
          andScrollDirection: (L3SDKParallaxLayerScrollDirection)scrollDirection
              andScrollSpeed:(float)scrollSpeed
                 andAutoPlay:(BOOL)autoPlay;

```
where:
<br/>
- <b>frame</b>:is the frame of the layer.
- <b>imageName</b>:is the image that you want to use within the parallax layer.
- <b>direction</b>:is the direction of the scroll and it can assume one of the following value:
```objectivec
typedef enum : NSUInteger {
    L3SDKParallaxLayerScrollDirectionUp,
    L3SDKParallaxLayerScrollDirectionDown,
    L3SDKParallaxLayerScrollDirectionRight,
    L3SDKParallaxLayerScrollDirectionLeft
} L3SDKParallaxLayerScrollDirection;
```
- <b>speed</b>:is the scroll speed (duration of the view animation).
<br/>
<br/>
The L3SDKParallaxLayer interface exposes also other two methods that allow to stop and start/resume the scrolling:
```objectivec
-(void)play;
-(void)stop;
```
Here an example of how to implement a parallax system
```objectivec
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

```

