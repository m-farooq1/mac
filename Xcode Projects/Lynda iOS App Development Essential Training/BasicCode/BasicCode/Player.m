//
//  Player.m
//  BasicCode
//
//  Created by Muhammad Farooq on 27/07/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import "Player.h"

@implementation Player

-(void)jump{
    NSLog(@"Jump");
}

-(void)fire{
    NSLog(@"Fire");
}

-(void)restartLevel:(int)levelNumber{
    NSLog(@"Restarting number %i level", levelNumber);
}

-(void) setPlayerName:(NSString *)name{
   _playerName= [name uppercaseString];
}

-(int) score{
    return self.score/10;
}



@end
