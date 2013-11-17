//
//  DetailsViewController.m
//  DES
//
//  Created by Saleh AlDhobaie on 12/25/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize round = _round;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.key.text = self.round.keyRound;
    self.shiftRight.text = self.round.keyRightShift;
    self.shiftLeft.text = self.round.keyLeftShift;
    self.compress.text = self.round.keySubKey;
    self.nextKey.text = self.round.keyNextRound;

    
    self.plainRight.text = self.round.plainRight;
    self.plainLeft.text = self.round.plainLeft;
    self.expand.text = self.round.plainExpandRight;
    self.sBox.text = self.round.plainSBoxRight;
    self.pBox.text = self.round.plainPBoxRight;
    self.nextRight.text = self.round.plainRightNextRound;
    self.nextLeft.text = self.round.plainRight;
    
    self.roundNumber.text = [NSString stringWithFormat:@"%d",self.numberOfRound];
    
    
    //    NSLog(@"self.key.text = %d", self.key.text.length);
    //    NSLog(@"self.shiftRight.text = %d", self.shiftRight.text.length);
    //    NSLog(@"self.shiftLeft.text = %d", self.shiftLeft.text.length);
    //    NSLog(@"self.compress.text = %d", self.compress.text.length);
    //    NSLog(@"self.nextKey.text = %d", self.nextKey.text.length);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
