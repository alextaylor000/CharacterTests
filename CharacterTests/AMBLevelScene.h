//
//  XXXMyScene.h
//  CharacterTests
//

//  Copyright (c) 2014 Alex Taylor. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "JSTileMap.h"
#import "AMBGameScene.h"
#import "AMBIndicator.h"
#import "AMBCamera.h"
#import "AMBScoreKeeper.h"

@interface AMBLevelScene : AMBGameScene <SKPhysicsContactDelegate>


#pragma Properties - Map
@property (readonly, nonatomic) JSTileMap *tilemap; // the tilemap for this level
@property (readonly, nonatomic) TMXLayer *mapLayerRoad; // road layer and characters
@property (readonly, nonatomic) TMXLayer *mapLayerScenery; // for buildings, grass, etc.

@property AMBCamera *camera;

// spawn point(s) will be kept on separate layers so we can choose them at random
// in the spawn methods
@property (readonly, nonatomic) TMXObjectGroup *mapGroupSpawnPlayer;
@property (readonly, nonatomic) TMXObjectGroup *mapGroupSpawnPatients;
@property (readonly, nonatomic) TMXObjectGroup *mapGroupSpawnHospitals;
@property (readonly, nonatomic) TMXObjectGroup *mapGroupSpawnTraffic;
@property (readonly, nonatomic) TMXObjectGroup *mapGroupSpawnPowerups;
@property (readonly, nonatomic) NSMutableDictionary *roadTilePaths;

#pragma mark Update Loop
@property (readonly, nonatomic) NSTimeInterval sceneLastUpdate;
@property (readonly, nonatomic) NSTimeInterval lastKeyPress;
@property (readonly, nonatomic) CGFloat sceneDelta;
@property AMBScoreKeeper *scoreKeeper;

@property AMBIndicator *indicator;

#pragma mark Methods
/** Loads a tilemap from disk and sets up all the layers.*/
- (void)levelWithTilemap:(NSString *)tilemapFile;







@end
