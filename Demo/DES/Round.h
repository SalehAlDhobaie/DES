//
//  Round.h
//  DES
//
//  Created by Saleh AlDhobaie on 12/8/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Round : NSObject




// Plain Text Right
@property (strong, nonatomic) NSString *plainRight;
@property (strong, nonatomic) NSString *plainExpandRight;
@property (strong, nonatomic) NSString *plainRightWithXorSubKey;
@property (strong, nonatomic) NSString *plainSBoxRight;
@property (strong, nonatomic) NSString *plainPBoxRight;
@property (strong, nonatomic) NSString *plainRightWithXorLeft;
@property (strong, nonatomic) NSString *plainRightNextRound;

// Plain Text Left
@property (strong, nonatomic) NSString *plainLeft;
@property (strong, nonatomic) NSString *plainLeftNextRound;

// key
@property (strong, nonatomic) NSString *keyRound;
@property (strong, nonatomic) NSString *keySubKey;
// key Right Text
@property (strong, nonatomic) NSString *keyRight;
@property (strong, nonatomic) NSString *keyRightShift;
@property (strong, nonatomic) NSString *keyNextRound;
// key Left Text
@property (strong, nonatomic) NSString *keyLeft;
@property (strong, nonatomic) NSString *keyLeftShift;




@end
