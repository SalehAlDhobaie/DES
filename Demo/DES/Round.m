//
//  Round.m
//  DES
//
//  Created by Saleh AlDhobaie on 12/8/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import "Round.h"

@implementation Round

@synthesize plainRight, plainExpandRight, plainRightWithXorSubKey, plainSBoxRight, plainPBoxRight, plainRightWithXorLeft, plainRightNextRound;

@synthesize plainLeft, plainLeftNextRound, keyRound, keySubKey, keyRight, keyRightShift, keyNextRound, keyLeft, keyLeftShift;

- (id)init {
 
    self = [super init];
    if (self) {
        
        self.plainExpandRight = [[NSString alloc]init];
        self.plainLeft = [[NSString alloc]init];
        self.plainLeftNextRound = [[NSString alloc]init];
        self.plainSBoxRight = [[NSString alloc]init];
        self.plainRightWithXorSubKey = [[NSString alloc]init];
        self.plainPBoxRight = [[NSString alloc]init];
        self.plainRight = [[NSString alloc]init];
        self.plainRightNextRound = [[NSString alloc]init];
        self.plainRightWithXorLeft = [[NSString alloc]init];
        self.keyLeft = [[NSString alloc]init];
        self.keyLeftShift =  [[NSString alloc]init];
        self.keyNextRound = [[NSString alloc]init];
        self.keyRight = [[NSString alloc]init];
        self.keyRightShift = [[NSString alloc]init];
        self.keyRound = [[NSString alloc]init];
        self.keySubKey = [[NSString alloc]init];
        
        return self;
    }
    return self;
}

- (NSString *)description {
    
    return self.keySubKey;
}

@end
