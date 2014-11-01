//
//  AMBCamera.h
//  CharacterTests
//
//  Created by Alex Taylor on 2014-10-31.
//  Copyright (c) 2014 Alex Taylor. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface AMBCamera : SKNode

@property (nonatomic) SKSpriteNode *targetSprite; // the sprite that the camera will follow
@property (nonatomic) CGSize boundingBox; // always centered in the screen. the target sprite is allowed to move within this bounding box without triggering a camera follow.
@property (nonatomic, readonly) BOOL cameraIsActive; // the camera is active if it's following the target sprite. if the target sprite has stopped moving, the camera will become idle when it has reframed the target sprite to the idle offset (below).
@property (nonatomic) BOOL reorientsToTargetSpriteDirection; // if YES, the camera will rotate to keep the target sprite facing up.
@property (nonatomic) CGPoint idleOffset; // the target sprite's position in the frame, relative to center, when the target sprite is idle
@property (nonatomic) CGPoint activeOffset; // the target sprite's position in the frame, relative to center, when the target sprite is moving. travelling outside of the bounding box triggers the camera to become active.

- (instancetype)initWithTargetSprite:(SKNode *)targetSprite;

@end
