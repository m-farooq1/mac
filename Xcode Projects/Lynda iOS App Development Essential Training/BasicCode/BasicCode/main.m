//
//  main.m
//  BasicCode
//
//  Created by Muhammad Farooq on 27/07/2014.
//  Copyright (c) 2014 Muhammad Farooq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString *msg= @"The quick fox jumps over the lazy dog.";
        NSString *aallCaps =  [msg uppercaseString];
        NSLog(@"%@", aallCaps);
        NSDate *today=[NSDate date];
        NSLog(@"%@", today);

        Player *pl=[[Player alloc] init];
        [pl jump];
        [pl fire];
        [pl restartLevel:99];

        [pl setScore:10000];
        [pl setPlayerName:@"Farooq"] ;
        
        NSLog(@"Player name is %@ and score is: %i", [pl playerName], [pl score]);
        
    }
    return 0;
}
