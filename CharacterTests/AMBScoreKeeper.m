//
//  AMBScoreKeeper.m
//  CharacterTests
//
//  Created by Alex Taylor on 2014-09-05.
//  Copyright (c) 2014 Alex Taylor. All rights reserved.
//

#import "AMBScoreKeeper.h"
#import "AMBLevelScene.h" 
#import "AMBPatient.h"
#import "SKTUtils.h" // for RandomFloatRange

@implementation AMBScoreKeeper

/**
 Instantiates a ScoreKeeper instance, and ensures that only one instance can be created.
 */
+ (AMBScoreKeeper *)sharedInstance {
    static AMBScoreKeeper *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[AMBScoreKeeper alloc]init];
    });
    
    return _sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        /* Initialize anything needed for game logic */
        _score = 0;
        _elapsedTime = 0;
        
        
        
    }
    
   return self;
}

- (SKLabelNode *)createScoreLabelWithPoints:(NSInteger)points atPos:(CGPoint)position {
    
    _labelScore = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    _labelScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    _labelScore.text = [NSString stringWithFormat:@"SCORE: %ld", (long)points];
    _labelScore.fontColor = [SKColor yellowColor];
    
    _labelScore.position = position;
    
    _labelScore.zPosition = 999;
    
    return _labelScore;
}

-(SKLabelNode *)createEventlabelAtPos:(CGPoint)position {
    if (!_labelEvent) {
        _labelEvent = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
        _labelEvent.text = @"EVENT!";
        _labelEvent.fontColor = [SKColor yellowColor];
        _labelEvent.fontSize = 60;
        _labelEvent.alpha = 0;
        _labelEvent.zPosition = 1000;
        _labelEvent.position = position;
    }
    
    return _labelEvent;

}

- (void)updateScoreLabelWithPoints:(NSInteger)points {
    _labelScore.text = [NSString stringWithFormat:@"SCORE: %ld", (long)points];
}


- (void) updateScore:(NSInteger)points {
    _score += points;
    
    [self updateScoreLabelWithPoints:_score];

    #if DEBUG
        NSLog(@"[[    SCORE:   %ld    ]]", (long)_score);
    #endif

}

#pragma mark Scoring Events
- (void) scoreEventDeliveredPatient:(AMBPatient *)patient {
    NSMutableDictionary *userData = patient.userData;
    
    NSInteger medicalSupplies = [[userData valueForKey:@"medicalSupplies"] integerValue];
    NSTimeInterval timeToLive = [[userData valueForKey:@"timeToLive"] doubleValue];
    NSInteger points =          [[userData valueForKey:@"points"] integerValue];
    
    // define the formula for applying points
    NSInteger netPoints = points;
    
    [self updateScore:netPoints];
    
#if DEBUG
    NSLog(@"patient DELIVERED!");
#endif
    
}

- (void)eventLabelWithText:(NSString *)text {
    _labelEvent.text = text;
    
    SKAction *action;
    action = [SKAction sequence:@[[SKAction fadeInWithDuration:0.075],[SKAction waitForDuration:2.0],[SKAction fadeOutWithDuration:0.075]]];
    [_labelEvent runAction:action];
    
}


#pragma mark Misc. Game Logic


@end
