//
//  ViewController.m
//  DES
//
//  Created by Saleh AlDhobaie on 12/5/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import "ViewController.h"
#import "RoundViewController.h"
#import "NSString+DES.h"
#import "Round.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *plain;
@property (weak, nonatomic) IBOutlet UILabel *plainCount;
@property (weak, nonatomic) IBOutlet UITextField *key;
@property (weak, nonatomic) IBOutlet UILabel *keyCount;

@property (weak, nonatomic) IBOutlet UILabel *cipher;

@end

@implementation ViewController
@synthesize  rounds = _rounds;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSArray *)rounds {
    
    if (!_rounds) {
        _rounds = [[NSArray alloc]init];
    }
    return _rounds;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //self.plain.text = @"Bandar05";
    //self.key.text = @"Bandar05";
    self.plain.tag = 1;
    self.key.tag = 2;
    
    self.plain.delegate = self;
    self.key.delegate = self;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wood_dark_background_texture_55321_1920x1200.jpg"]];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    NSLog(@"length = %d", newLength);
    NSInteger count = 9;
    if (newLength == 0 ) {
        count = 8;
    }
    if (textField.tag == 1) {
        self.plainCount.text = [NSString stringWithFormat:@"%d", count - newLength];
    }else {
        self.keyCount.text = [NSString stringWithFormat:@"%d", count - newLength];
    }
    
    return (newLength > 8) ? NO : YES;
}


- (NSArray *)encryptPlainText:(NSString *)plaintext WithKey:(NSString *)keytext {
    
    NSMutableArray *rounds = [[NSMutableArray alloc]init];
    Round *round;
    // convert to Binary
    NSString *plainBinary = [NSString stringByConvertToBinary:plaintext];
    NSString *keyBinary = [NSString stringByConvertToBinary:keytext];
    
    plainBinary = [NSString plainInitialPermutation:plainBinary];
    keyBinary = [NSString keyInitialPermutation:keyBinary];
    
    for (NSInteger i= 0; i< 16; i++){
        round = [[Round alloc]init];
        NSRange keyRange;
        keyRange.length = 28;
        keyRange.location = 28;
        NSString * rightToShift = [keyBinary substringWithRange:keyRange];
        NSString * leftToShift = [keyBinary substringToIndex:28];
        
        // Shift Keys and Concationation for SubKey
        round.keyRightShift = [NSString keyShift:rightToShift AtRound:0];
        round.keyLeftShift = [NSString keyShift:leftToShift AtRound:0];
        round.keyRound = [NSString stringWithFormat:@"%@%@", round.keyRightShift, round.keyLeftShift];
        keyBinary = round.keyRound;
        
        NSString *subKey = [NSString stringWithFormat:@"%@%@", round.keyLeftShift, round.keyRightShift];
        round.keySubKey = [NSString keyCompress:subKey];
        round.keyNextRound = subKey;
        
        
        NSRange range;
        range.length = 32;
        range.location = 0;
        round.plainLeft = [plainBinary substringWithRange:range];
        
        round.plainRight = [plainBinary substringFromIndex:32];

        round.plainLeftNextRound = round.plainRight;
        round.plainExpandRight = [NSString plainExpand:round.plainRight];
        round.plainRightWithXorSubKey = [NSString stringByXORBinaryString:round.plainExpandRight WithBinaryString:round.keySubKey];
        round.plainSBoxRight = [NSString plainSBox:round.plainRightWithXorSubKey];
        round.plainPBoxRight = [NSString plainPBox:round.plainSBoxRight];
        round.plainRightNextRound = [NSString stringByXORBinaryString:round.plainPBoxRight WithBinaryString:round.plainLeft];
        
        if( i == 15){
            
            NSString *finalPermutation = [NSString stringWithFormat:@"%@%@", round.plainLeftNextRound, round.plainRightNextRound];
            finalPermutation = [NSString plainFainalPermutation:finalPermutation];
            NSRange finalRange;
            finalRange.location = 0;
            finalRange.length = 32;
            round.plainLeftNextRound = [finalPermutation substringFromIndex:32];
            round.plainRightNextRound = [finalPermutation substringWithRange:finalRange];
        }
        
        [rounds addObject:round];
    }
    return rounds;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"Rounds"]){
        RoundViewController *VC = segue.destinationViewController;
        [VC setRounds:[self.rounds copy]];
        
        
    }
    
}


- (IBAction)DetailsRound:(id)sender {
    
    UIAlertView *alert;
    if (self.plain.text.length < 8 || self.plain.text.length > 8 || self.key.text.length < 8 || self.key.text.length > 8) {
        alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"plain and key text it must be 8 character" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else if (self.rounds.count == 0){
        
        alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You must perform DES" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else {
        [self performSegueWithIdentifier:@"Rounds" sender:nil];
    }
    

}


- (IBAction)perform:(id)sender {

    UIAlertView *alert;
    if (self.plain.text.length < 8 || self.plain.text.length > 8 || self.key.text.length < 8 || self.key.text.length > 8) {
        alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"plain and key text it must be 8 character" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }else {
        
        self.rounds = [self encryptPlainText:self.plain.text WithKey:self.key.text];
        Round *final = [self.rounds objectAtIndex:15];
        NSString * cipherBinary = [NSString stringWithFormat:@"%@%@", final.plainLeftNextRound, final.plainRightNextRound];
        self.cipher.text = [NSString stringByConvertBinaryToASCIIString:[cipherBinary mutableCopy]];
        
    }
}


- (IBAction)copy:(id)sender {
    UIAlertView *alert;
    if (self.rounds.count == 0){
        
        alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You must perform DES" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
    }else {
        [UIPasteboard generalPasteboard].string = self.cipher.text;
        alert = [[UIAlertView alloc]initWithTitle:@"Done" message:@"Cipher Copied =p" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
    }
    [alert show];
    
}


@end
