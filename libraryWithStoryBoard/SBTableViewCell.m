//
//  SBTableViewCell.m
//  libraryWithStoryBoard
//
//  Created by Pooja Kamath on 26/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewCell.h"

@implementation SBTableViewCell
@synthesize returnButton;
@synthesize issueButton;
//@synthesize cellLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        // set the button color
        UIColor *clr = [UIColor colorWithRed:0.89f green:0.81f blue:0.87f alpha:1];
        
        issueButton=[[UIButton alloc]init];
        returnButton=[[UIButton alloc]init];

               
        
        //set the background color
        issueButton.backgroundColor=clr;
        
        //set title for the button
        [issueButton setTitle:@"Issue" forState:UIControlStateNormal];
        
        
        
        //action of the  issue button
        [issueButton addTarget:self action:@selector(issue:) forControlEvents:UIControlEventTouchUpInside];
        
        //add button to the table view cell
        [self addSubview:issueButton ];
        [issueButton release];
        
        //set the frame for the button
        returnButton.frame = CGRectZero;
        
        //set the background color
        returnButton.backgroundColor=clr;
        
        //set title for the button
        [returnButton setTitle:@"Return" forState:UIControlStateNormal];
        
        //action of the  issue button
        [returnButton addTarget:self action:@selector(returns:) forControlEvents:UIControlEventTouchUpInside];
        
        //add button to the table view cell
        [self addSubview:returnButton];
        [returnButton release];
        
        //set a accessory button to display details
        self.accessoryType = UITableViewCellAccessoryDetailButton;
        
        //return cell
        return self;
        

    }
    return self;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
    {
        //set issue button frame
        [issueButton setFrame:CGRectMake(160.0f, 15.0f, 45.0f, 25.0f)];
        
        //set return button frame
        [returnButton setFrame:CGRectMake(issueButton.frame.origin.x+issueButton.frame.size.width+5, 15.0f, 55.0f, 25.0f)];
    }
    else{
        //set issue button frame
        [issueButton setFrame:CGRectMake(310.0f, 15.0f, 45.0f, 25.0f)];
        
        //set return button frame
        [returnButton setFrame:CGRectMake(issueButton.frame.origin.x+issueButton.frame.size.width+5, 15.0f, 55.0f, 25.0f)];
        
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




-(void)issue:(UIButton*)sender
{
    //call the delegate method on  issuing the book
    
    [_delegate issueButton:sender];
    
    
}
-(void)returns:(UIButton*)sender
{
    //call the delegate method on returning the book
    
    [_delegate returnsButton:sender];
    
}


- (void)dealloc
{
    
    

    [super dealloc];
    
}

@end
