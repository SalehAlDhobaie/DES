//
//  DetailsViewController.h
//  DES
//
//  Created by Saleh AlDhobaie on 12/25/12.
//  Copyright (c) 2012 Saleh AlDhobaie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Round.h"

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Round * round;
@property (nonatomic) NSInteger numberOfRound;

// Key
@property (weak, nonatomic) IBOutlet UILabel *key;
@property (weak, nonatomic) IBOutlet UILabel *shiftRight;
@property (weak, nonatomic) IBOutlet UILabel *shiftLeft;
@property (weak, nonatomic) IBOutlet UILabel *compress;
@property (weak, nonatomic) IBOutlet UILabel *nextKey;

// Plain
@property (weak, nonatomic) IBOutlet UILabel *plainRight;
@property (weak, nonatomic) IBOutlet UILabel *plainLeft;
@property (weak, nonatomic) IBOutlet UILabel *expand;
@property (weak, nonatomic) IBOutlet UILabel *sBox;
@property (weak, nonatomic) IBOutlet UILabel *pBox;
@property (weak, nonatomic) IBOutlet UILabel *nextRight;
@property (weak, nonatomic) IBOutlet UILabel *nextLeft;
@property (weak, nonatomic) IBOutlet UILabel *roundNumber;


@end
