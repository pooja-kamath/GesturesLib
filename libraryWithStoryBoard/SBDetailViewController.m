//
//  SBDetailViewController.m
//  libraryWithStoryBoard
//
//  Created by Pooja Kamath on 26/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBDetailViewController.h"
#import "SBBook.h"
#import "SBBookManager.h"
@interface SBDetailViewController ()

@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UILabel *bookIdLabel;
@property (retain, nonatomic) IBOutlet UILabel *authorLabel;
- (IBAction)okButton:(id)sender;
- (IBAction)deleteButton:(id)sender;
@property (retain, nonatomic) IBOutlet UISwitch *issueSwitch;
@property (retain, nonatomic) IBOutlet NSLayoutConstraint *btnOkLeftConstraint;

@end

@implementation SBDetailViewController

@synthesize books;
@synthesize delegate;

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
   
        _sharedBookManager = [SBBookManager sharedManager];
    
    
    NSLog(@"%@",books.title);
    //set the label values
    _titleLabel.text=self.books.title;
    _bookIdLabel.text=self.books.bookId;
    _authorLabel.text=self.books.author;
    _issueSwitch.On =self.books.issued;
    
    
    
    //disable user interaction of the switch
    _issueSwitch.userInteractionEnabled=NO;
    

    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"YES"])
    {
        //call the method to remove the book in shared manager
        [_sharedBookManager  removeBook:books];
       
        //display alert that book has been deleted
        UIAlertView *alertAfterDeletion=[[UIAlertView alloc]initWithTitle:@"alert" message:@"book is deleted" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertAfterDeletion show];
        [alertAfterDeletion release];
        
        [delegate didFinish];
    }
   
    
}

- (IBAction)okButton:(id)sender
{
       
    [delegate didFinish];
    
}

- (IBAction)deleteButton:(id)sender
{
    
    
    //display alert asking whether to delete a book or not
    UIAlertView *alertBeforeDeletion=[[[UIAlertView alloc]initWithTitle:@"alert" message:@"delete the book??" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil, nil]autorelease];
    
    [alertBeforeDeletion addButtonWithTitle:@"YES"];
    [alertBeforeDeletion show];

}
- (void)dealloc {
    
    [_titleLabel release];
    [_bookIdLabel release];
    [_authorLabel release];
    [_issueSwitch release];
    [_btnOkLeftConstraint release];
    [super dealloc];
}

@end
