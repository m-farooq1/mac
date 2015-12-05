//
//  Player.h
//  BasicCode
//
//  Created by Muhammad Farooq on 27/07/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject{
   
}

@property (nonatomic) int score;
@property(nonatomic) NSString *playerName;

-(void) jump;
-(void) fire;
-(void) restartLevel: (int) levelNumber;

@end
