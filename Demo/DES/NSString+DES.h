//
//  NSString+DES.h
//  DES
//
//  Created by Saleh AlDhobaie on 12/6/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DES)



#pragma mark - Convert Text Method

// Convert Plain text to Bianry text
- (NSString *)stringByConvertToBinary:(NSString *)plainText;
+ (NSString *)stringByConvertToBinary:(NSString *)plainText;

//
- (NSString *)stringByConvertBinaryToString:(NSMutableString *)value;
+ (NSString *)stringByConvertBinaryToString:(NSMutableString *)value;
- (NSString *)stringByConvertBinaryToASCIIString:(NSMutableString *)value;
+ (NSString *)stringByConvertBinaryToASCIIString:(NSMutableString *)value;


// XOR Operation for two String
- (NSString *)stringByXORBinaryString:(NSString *)value1 WithBinaryString:(NSString *)value2;
+ (NSString *)stringByXORBinaryString:(NSString *)value1 WithBinaryString:(NSString *)value2;

#pragma mark - Plain Text Method

- (NSString *)plainInitialPermutation:(NSString *)value;
+ (NSString *)plainInitialPermutation:(NSString *)value;

- (NSString *)plainExpand:(NSString *)value;
+ (NSString *)plainExpand:(NSString *)value;

- (NSString *)plainSBox:(NSString*)value;
+ (NSString *)plainSBox:(NSString*)value;

- (NSString * )plainPBox:(NSString *)value;
+ (NSString * )plainPBox:(NSString *)value;

- (NSString *)plainFainalPermutation:(NSString *)value;
+ (NSString *)plainFainalPermutation:(NSString *)value;

#pragma mark - Key Text Method


- (NSString *)keyInitialPermutation:(NSString *)value;
+ (NSString *)keyInitialPermutation:(NSString *)value;

- (NSString *)keyShift:(NSString *)value AtRound:(NSInteger)round;
+ (NSString *)keyShift:(NSString *)value AtRound:(NSInteger)round;

- (NSString *)keyCompress:(NSString *)value;
+ (NSString *)keyCompress:(NSString *)value;



@end
