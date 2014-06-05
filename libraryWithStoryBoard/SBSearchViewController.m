//
//  SBSearchViewController.m
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 28/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBSearchViewController.h"

@interface SBSearchViewController ()

@property (retain, nonatomic) IBOutlet UITextField *searchLabel;
- (IBAction)OkButton:(id)sender;

@end

@implementation SBSearchViewController

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
    
    //create an singleton instance of shared manager
     _sharedBookManager = [SBBookManager sharedManager];
    
    //set the textfield delegate as self
    _searchLabel.delegate=self;
    _searchLabel.clearsOnBeginEditing=YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)OkButton:(id)sender
{
    //call the method to search book with the title
   NSInteger searchResult=[_sharedBookManager searchBookWithTitle:_searchLabel.text];
    //if the book is not present print a alert that book is not present
    if(searchResult ==-1)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"book not present" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];

    }
    //if book is present perform segue and load a view displaying the details of the book
    else
    {
        [self performSegueWithIdentifier:@"details" sender:[_sharedBookManager getBookAtIndex:searchResult]];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(SBBook *)sender
{
    //set the value of the detailview with the book passed in perform segue
        SBDetailViewController *detailView = (SBDetailViewController *)segue.destinationViewController ;
        detailView.books=sender;
    
    
}
- (IBAction)cancelButton:(id)sender
{
    //push the tableview
    UITableViewController *table = [self.storyboard instantiateViewControllerWithIdentifier:@"tableViews"];
  
    [self.navigationController pushViewController:table animated:YES];
    
    
   }
-(BOOL)textFieldShouldReturn:(UITextField *)textfield
{
    //resign keyboard
    [textfield resignFirstResponder];
    return YES;
    
}
- (void)dealloc {
    
    [_searchLabel release];
    _searchLabel=nil;
    [super dealloc];
}

@end
