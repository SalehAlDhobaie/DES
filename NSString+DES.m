//
//  NSString+DES.m
//  DES
//
//  Created by Saleh AlDhobaie on 12/6/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import "NSString+DES.h"
@implementation NSString (DES)


#pragma mark Plain Text Table 

static const int CONST_INITIAL_PERMUTATION_TABLE [] =
{
    57, 49, 41, 33, 25, 17, 9 , 1 ,
    59, 51, 43, 35, 27, 19, 11, 3 ,
    61, 56, 45, 37, 29, 21, 13, 5 ,
    63, 55, 47, 39, 31, 23, 15, 7 ,
    56, 48, 40, 32, 24, 16, 8 , 0 ,
    58, 50, 42, 34, 26, 18, 10, 2 ,
    60, 52, 44, 36, 28, 20, 12, 4 ,
    62, 54, 46, 38, 30, 22, 14, 6
};


static int CONST_EXPAND_PERMUTATION_TABLE [48] = {
    
    31, 0 , 1 , 2 , 3 , 4 , 3 , 4 ,
    5 , 6 , 7 , 8 , 7 , 8 , 9 , 10,
    11, 12, 11, 12, 13, 14, 15, 16,
    15, 16, 17, 18, 19, 20, 19, 20,
    21, 22, 23, 24, 23, 24, 25, 26,
    27, 28, 27, 28, 29, 30, 31, 0
    
};

static const int CONST_SBOX_PERMUTATION_TABLE [4][16] =
{
    {14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7},
    {0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8},
    {4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0},
    {15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13}
};

static const int CONST_PBOX_PERMUTATION_TABLE [32] =
{
    15, 6 , 19, 20, 28, 11, 27, 16,
    0 , 14, 22, 25, 4 , 17, 30, 9 ,
    1 , 7 , 23, 13, 31, 26, 2 , 8 ,
    18, 12, 29, 5 , 21, 10, 3 , 24
};


static const int CONST_FINAL_PERMUTATION_TABLE [] =
{
    39, 7 , 47, 15, 55, 23, 63, 31,
    38, 6 , 46, 14, 54, 22, 62, 30,
    37, 5 , 45, 13, 53, 21, 61, 29,
    36, 4 , 44, 12, 52, 20, 60, 28,
    35, 3 , 43, 11, 51, 19, 59, 27,
    34, 4 , 42, 10, 50, 18, 58, 26,
    33, 1 , 41, 9 , 49, 17, 57, 25,
    32, 0 , 40, 8 , 48, 16, 56, 24
};

#pragma mark Key Text Table

static const int CONST_KEY_INTIAL_PERMUTATION_TABLE [] =
{
    56, 48, 40, 32, 24, 16, 8 , 0 ,
    57, 49, 41, 33, 25, 17, 9 , 1 ,
    58, 50, 42, 34, 26, 18, 10, 2 ,
    59, 51, 43, 35, 62, 54, 46, 38,
    30, 22, 14, 6 , 61, 53, 45, 37,
    29, 21, 13, 5 , 60, 52, 44, 36,
    28, 20, 12, 4 , 27, 19, 11, 3
};

static const int CONST_COMPRESS_TABLE [] =
{
    13, 16, 10, 23, 0 , 4 , 2 , 27,
    14, 5 , 20, 9 , 22, 18, 11, 3 ,
    25, 7 , 15, 6 , 26, 19, 12, 1 ,
    40, 51, 30, 36, 46, 54, 29, 39,
    50, 44, 32, 47, 43, 48, 38, 55,
    33, 52, 45, 41, 49, 35, 28, 31,
};




#pragma mark - Plain Text Method

- (NSString *)plainInitialPermutation:(NSString *)value {
    
    char afterPermutation [64];
    const char * beforePermutation = [value cStringUsingEncoding:NSUTF8StringEncoding];
    for (NSInteger i = 0; i<64; i++){
        afterPermutation[i] = beforePermutation[CONST_INITIAL_PERMUTATION_TABLE[i]];
        
    }
    
    NSString *result = [[NSString alloc]initWithBytes:afterPermutation length:sizeof(afterPermutation) encoding:NSUTF8StringEncoding];
    return result;
}


+ (NSString *)plainInitialPermutation:(NSString *)value {
    
    char afterPermutation [64];
    const char * beforePermutation = [value cStringUsingEncoding:NSUTF8StringEncoding];
    for (NSInteger i = 0; i<64; i++){
        afterPermutation[i] = beforePermutation[CONST_INITIAL_PERMUTATION_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:afterPermutation length:sizeof(afterPermutation) encoding:NSUTF8StringEncoding];

    return result;
    
}


- (NSString *) plainExpand:(NSString *) value{
    const char * beforeExpand = [value cStringUsingEncoding:NSUTF8StringEncoding];
    char afterExpand [48];
    for (NSInteger i =0 ; i< CHAR_BIT*6 ; i++) {
        afterExpand [i] = beforeExpand[CONST_EXPAND_PERMUTATION_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:afterExpand length:sizeof(afterExpand) encoding:NSUTF8StringEncoding];
    return result;
}

+ (NSString *) plainExpand:(NSString *) value{
    const char * beforeExpand = [value cStringUsingEncoding:NSUTF8StringEncoding];
    char afterExpand [48];
    for (NSInteger i = 0 ; i< 48 ; i++) {
        afterExpand [i] = beforeExpand[CONST_EXPAND_PERMUTATION_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:afterExpand length:sizeof(afterExpand) encoding:NSUTF8StringEncoding];
    return result;
}

- (NSString *)plainSBox:(NSString*)value {
    
    NSMutableArray *blocks = [NSMutableArray array];
    for(NSInteger i =0; i<value.length; i++){
        [blocks addObject:[NSString stringWithFormat:@"%@", [value substringToIndex:6]]];
        value = [value substringFromIndex:6];
    }
    [blocks addObject:[NSString stringWithFormat:@"%@", value]];
    
    NSString *row = [NSString string];
    NSString *column = [NSString string];
    NSRange range;
    range.length = 4;
    range.location = 1;
    char *rowValue;
    NSInteger rowDecimal;
    NSInteger columnDecimal;
    char *columnValue;
    NSMutableString *result = [NSMutableString string];
    
    for (NSString *block  in blocks) {
        row = [NSString stringWithFormat:@"%c%c", [block characterAtIndex:0], [block characterAtIndex:5]];
        column = [block substringWithRange:range];
        rowDecimal = strtol(row.UTF8String, &rowValue, 2);
        columnDecimal = strtol(column.UTF8String, &columnValue, 2);
        [result appendFormat:@"%@", [self stringByConvertIntegerToBinary:CONST_SBOX_PERMUTATION_TABLE[rowDecimal][columnDecimal]]];
    }
    
    return result;
}

+ (NSString *)plainSBox:(NSString*)value {
    
    NSMutableArray *blocks = [NSMutableArray array];
    for(NSInteger i =0; i<value.length; i++){
        [blocks addObject:[NSString stringWithFormat:@"%@", [value substringToIndex:6]]];
        value = [value substringFromIndex:6];
    }
    [blocks addObject:[NSString stringWithFormat:@"%@", value]];
    
    NSString *row = [NSString string];
    NSString *column = [NSString string];
    NSRange range;
    range.length = 4;
    range.location = 1;
    char *rowValue;
    NSInteger rowDecimal;
    NSInteger columnDecimal;
    char *columnValue;
    NSMutableString *result = [NSMutableString string];
    
    for (NSString *block  in blocks) {
        row = [NSString stringWithFormat:@"%c%c", [block characterAtIndex:0], [block characterAtIndex:5]];
        column = [block substringWithRange:range];
        rowDecimal = strtol(row.UTF8String, &rowValue, 2);
        columnDecimal = strtol(column.UTF8String, &columnValue, 2);

        [result appendFormat:@"%@", [self stringByConvertIntegerToBinary:CONST_SBOX_PERMUTATION_TABLE[rowDecimal][columnDecimal]]];
    }
    
    return result;
}

- (NSString * )plainPBox:(NSString *)value {
    
    const char * beforePermutation = [value cStringUsingEncoding:NSUTF8StringEncoding];
    char afterPermutation [32];
    for ( int i = 0 ; i < 32 ; i++ ){
        afterPermutation[i] = beforePermutation[CONST_PBOX_PERMUTATION_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:afterPermutation length:sizeof(afterPermutation) encoding:NSUTF8StringEncoding];
    return result;
}

+ (NSString * )plainPBox:(NSString *)value {
    
    const char * beforePermutation = [value cStringUsingEncoding:NSUTF8StringEncoding];
    char afterPermutation [32];
    for ( int i = 0 ; i < 32 ; i++ ){
        afterPermutation[i] = beforePermutation[CONST_PBOX_PERMUTATION_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:afterPermutation length:sizeof(afterPermutation) encoding:NSUTF8StringEncoding];
    return result;

}


- (NSString *)plainFainalPermutation:(NSString *)value {
    
    char afterPermutation [64];
    const char * beforePermutation = [value cStringUsingEncoding:NSUTF8StringEncoding];
    for (NSInteger i =0; i<64; i++){
        afterPermutation[i] = beforePermutation[CONST_FINAL_PERMUTATION_TABLE[i]];
        
    }
    NSString *result = [[NSString alloc]initWithBytes:afterPermutation length:sizeof(afterPermutation) encoding:NSUTF8StringEncoding];
    return result;
}

+ (NSString *)plainFainalPermutation:(NSString *)value {
    
    char afterPermutation [64];
    const char * beforePermutation = [value cStringUsingEncoding:NSUTF8StringEncoding];
    for (NSInteger i =0; i<64; i++){
        afterPermutation[i] = beforePermutation[CONST_FINAL_PERMUTATION_TABLE[i]];
        
    }
    NSString *result = [[NSString alloc]initWithBytes:afterPermutation length:sizeof(afterPermutation) encoding:NSUTF8StringEncoding];
    return result;
}



#pragma mark - Key Text Method

- (NSString *)keyInitialPermutation:(NSString *)value{
    
    const char * beforePermutation = [value cStringUsingEncoding:NSUTF8StringEncoding];
    char shiftPermutatioKey [56];
    for(NSInteger i= 0; i< sizeof(shiftPermutatioKey); i++){
        shiftPermutatioKey[i] = beforePermutation[CONST_KEY_INTIAL_PERMUTATION_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:shiftPermutatioKey length:sizeof(shiftPermutatioKey) encoding:NSUTF8StringEncoding];
    return result;
}

+ (NSString *)keyInitialPermutation:(NSString *)value{
    
    const char * beforePermutation = [value cStringUsingEncoding:NSUTF8StringEncoding];
    char shiftPermutatioKey [56];
    for(NSInteger i= 0; i< sizeof(shiftPermutatioKey); i++){
        shiftPermutatioKey[i] = beforePermutation[CONST_KEY_INTIAL_PERMUTATION_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:shiftPermutatioKey length:sizeof(shiftPermutatioKey) encoding:NSUTF8StringEncoding];
    return result;}

- (NSString *)keyShift:(NSString *)value AtRound:(NSInteger)round {
    
    if( round == 0 || round == 1 || round == 8 || round == 15 ) {
        value = [NSString stringWithFormat:@"%@%c", [value substringFromIndex:1], [value characterAtIndex:0]];
    }else {
        value = [NSString stringWithFormat:@"%@%@", [value substringFromIndex:1], [value substringToIndex:2]];
    }
    return value;
}


+ (NSString *)keyShift:(NSString *)value AtRound:(NSInteger)round {
    
    if( round == 0 || round == 1 || round == 8 || round == 15 ) {
        value = [NSString stringWithFormat:@"%@%c", [value substringFromIndex:1], [value characterAtIndex:0]];
    }else {
        value = [NSString stringWithFormat:@"%@%@", [value substringFromIndex:1], [value substringToIndex:2]];
    }
    return value;
}

- (NSString *)keyCompress:(NSString *)value {
    
    const char * recive = [value cStringUsingEncoding:NSUTF8StringEncoding];
    char afterCompress [48];
    for (NSInteger i=0 ; i< 48; i++){
        afterCompress[i] = recive[CONST_COMPRESS_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:afterCompress length:sizeof(afterCompress) encoding:NSUTF8StringEncoding];
    return result;
}


+ (NSString *)keyCompress:(NSString *)value {
    
    const char * recive = [value cStringUsingEncoding:NSUTF8StringEncoding];
    char afterCompress [48];
    for (NSInteger i=0 ; i< 48; i++){
        afterCompress[i] = recive[CONST_COMPRESS_TABLE[i]];
    }
    NSString *result = [[NSString alloc]initWithBytes:afterCompress length:sizeof(afterCompress) encoding:NSUTF8StringEncoding];
    return result;
}


#pragma mark - Convert Method

- (NSString * ) CharToBinary:(NSInteger)value {
    
    NSMutableString * result = [NSMutableString string];
    
    for (NSInteger i = CHAR_BIT-1; i >= 0 ; i--) {
        NSInteger theBit = (value >> i) & 1;
        [result appendFormat:@"%d",theBit];
    }
    
    return result;
}


- (NSString *)stringByConvertToBinary:(NSString *)plainText {
    
    NSMutableString *binary = [NSMutableString string];
    
    for (NSInteger i = 0; i< CHAR_BIT; i++){
        NSInteger value = [plainText characterAtIndex:i];
        [binary appendString:[self CharToBinary:value]];
    }
    return (NSString *)binary;
}

+ (NSString *)stringByConvertToBinary:(NSString *)plainText {
    
    NSMutableString *binary = [NSMutableString string];
    
    for (NSInteger i = 0; i< CHAR_BIT; i++){
        NSInteger value = [plainText characterAtIndex:i];
        [binary appendString:[self CharToBinary:value]];
    }
    return (NSString *)binary;
}

+ (NSString * ) CharToBinary:(NSInteger)value {
    
    NSMutableString * result = [NSMutableString string];
    
    for (NSInteger i = CHAR_BIT-1; i >= 0 ; i--) {
        NSInteger theBit = (value >> i) & 1;
        [result appendFormat:@"%d",theBit];
    }
    
    return result;
}


- (NSString *)stringByXORBinaryString:(NSString *)value1 WithBinaryString:(NSString *)value2 {
    
    NSMutableString *result = [NSMutableString string];
    BOOL bit;
    for (NSInteger i = 0; i< value1.length; i++) {
        bit = [value1 characterAtIndex:i] ^ [value2 characterAtIndex:i];
        [result appendFormat:@"%d",bit];
    }
    return result;
}


+ (NSString *)stringByXORBinaryString:(NSString *)value1 WithBinaryString:(NSString *)value2 {
    
    NSMutableString *result = [NSMutableString string];
    BOOL bit;
    for (NSInteger i = 0; i< value1.length; i++) {
        bit = [value1 characterAtIndex:i] ^ [value2 characterAtIndex:i];
        [result appendFormat:@"%d",bit];
    }
    return result;
}

- (NSString *)stringByConvertIntegerToBinary:(NSInteger)value {
    
    NSMutableString *str = [NSMutableString string];
    NSInteger numberCopy = value; // so you won't change your original value
    for(NSInteger i = 0; i < 4 ; i++) {
        // Prepend "0" or "1", depending on the bit
        [str insertString:((numberCopy & 1) ? @"1" : @"0") atIndex:0];
        numberCopy >>= 1;
    }
    return str;
}

+ (NSString *)stringByConvertIntegerToBinary:(NSInteger)value {
    
    NSMutableString *str = [NSMutableString string];
    NSInteger numberCopy = value; // so you won't change your original value
    for(NSInteger i = 0; i < 4 ; i++) {
        // Prepend "0" or "1", depending on the bit
        [str insertString:((numberCopy & 1) ? @"1" : @"0") atIndex:0];
        numberCopy >>= 1;
    }
    return str;
}

- (NSString *)stringByConvertBinaryToASCIIString:(NSMutableString *)value{
    
    for(int i = 0; i<value.length; i++){
        if (i % 9 == 0)
            [value insertString:@" " atIndex:i];
    }
    
    NSMutableArray *tokens = (NSMutableArray *)[value componentsSeparatedByString:@" "];
    [tokens removeObjectAtIndex:0];
    NSMutableString *result = [NSMutableString string];
    for (NSString *tocken in tokens) {
        long v = strtol([tocken UTF8String], NULL, 2);
        [result appendFormat:@"%c",(char)(v+48)];
    }
    return result;
}

+ (NSString *)stringByConvertBinaryToASCIIString:(NSMutableString *)value{
    
    for(int i = 0; i<value.length; i++){
        if (i % 9 == 0)
            [value insertString:@" " atIndex:i];
    }
    
    NSMutableArray *tokens = (NSMutableArray *)[value componentsSeparatedByString:@" "];
    [tokens removeObjectAtIndex:0];
    NSMutableString *result = [NSMutableString string];
    for (NSString *tocken in tokens) {
        long v = strtol([tocken UTF8String], NULL, 2);
        [result appendFormat:@"%c",(char)(v+48)];
    }
    return result;
}


- (NSString *)stringByConvertBinaryToString:(NSMutableString *)value{
    
    for(int i = 0; i<value.length; i++){
        if (i % 9 == 0)
            [value insertString:@" " atIndex:i];
    }
    
    NSMutableArray *tokens = (NSMutableArray *)[value componentsSeparatedByString:@" "];
    [tokens removeObjectAtIndex:0];
    NSMutableString *result = [NSMutableString string];
    for (NSString *tocken in tokens) {
        long v = strtol([tocken UTF8String], NULL, 2);
        [result appendFormat:@"%c",(char)v];
    }
    return result;
}

+ (NSString *)stringByConvertBinaryToString:(NSMutableString *)value{
    
    for(int i = 0; i<value.length; i++){
        if (i % 9 == 0)
            [value insertString:@" " atIndex:i];
    }
    
    NSMutableArray *tokens = (NSMutableArray *)[value componentsSeparatedByString:@" "];
    [tokens removeObjectAtIndex:0];
    NSMutableString *result = [NSMutableString string];
    for (NSString *tocken in tokens) {
        long v = strtol([tocken UTF8String], NULL, 2);
        [result appendFormat:@"%c",(char)v];
    }
    return result;
}





@end
