//
//  SBtabViewController.m
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 02/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTabViewController.h"

@interface SBTabViewController ()

@end

@implementation SBTabViewController

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
    
    //hide the back button in the navigation
    self.navigationItem.hidesBackButton=YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
