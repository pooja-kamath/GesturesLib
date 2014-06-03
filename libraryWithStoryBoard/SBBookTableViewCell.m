//
//  SBBookTableViewCell.m
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 02/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBookTableViewCell.h"

@implementation SBBookTableViewCell
@synthesize downloadButton;
@synthesize delegate;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        // set the button color
        UIColor *clr = [UIColor colorWithRed:0.89f green:0.81f blue:0.87f alpha:1];
        
        //create the download button
        downloadButton=[[UIButton alloc]init];
        downloadButton.backgroundColor=clr;
        
        //set title for the button
        [downloadButton setTitle:@"Download" forState:UIControlStateNormal];

        //action of the  issue button
        [downloadButton addTarget:self action:@selector(downloadButton:) forControlEvents:UIControlEventTouchUpInside];
        
        //add the button to subview
        [self addSubview:downloadButton];
        [downloadButton release];
        
    }
    return self;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    
    //set the button frame based on the orientation of the status bar
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
    {
          [downloadButton setFrame:CGRectMake(220, 15.0f,90.0f, 25.0f)];
    }
    else{
       
        [downloadButton setFrame:CGRectMake(380, 15.0f,90.0f, 25.0f)];
        
    }
    
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)downloadButton:(UIButton*)sender
{
    //call the delegate method on  issuing the book
    
    [delegate downloadButton:sender];
    
    
}
- (void)dealloc
{
    [downloadButton release];
    downloadButton=nil;
    [super dealloc];
}
@end
