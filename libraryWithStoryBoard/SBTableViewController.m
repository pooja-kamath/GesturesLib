//
//  SBTableTableViewController.m
//  libraryWithStoryBoard
//
//  Created by Pooja Kamath on 26/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewController.h"
#import "SBBookManager.h"
#import "SBDetailViewController.h"
#import "SBTableViewCell.h"

@interface SBTableViewController ()
@property (retain, nonatomic) IBOutlet UITableView *table;
@end

@implementation SBTableViewController
@synthesize cell;
@synthesize indexPaths;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //create a instance of the shared manager
    
    _sharedBookManager = [SBBookManager sharedManager];
    
  //hide the back button in the navigation item
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [self.table registerClass:[SBTableViewCell class] forCellReuseIdentifier:@"SimpleTableItems"];
    

}
-(void)viewWillAppear:(BOOL)animated
{
    [self.table reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)table
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)table  numberOfRowsInSection:(NSInteger)section
{
    //return  count of books added
    return [_sharedBookManager getNumberOfBooksAdded];
}

- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //deque reuseable cells
    
      cell = [table dequeueReusableCellWithIdentifier:@"SimpleTableItems"];
    
    //assign self as the delegate of the cell
    cell.delegate=self;
   
    // set the button color
    UIColor *clr = [UIColor colorWithRed:0.89f green:0.81f blue:0.87f alpha:1];

    //check if book is issued or not and enable the uibutton in cell
    if([_sharedBookManager getBookAtIndex:indexPath.row].issued==YES)
    {
        cell.issueButton.enabled=NO;
        cell.returnButton.enabled=YES;
        cell.issueButton.backgroundColor=[UIColor whiteColor];
        cell.returnButton.backgroundColor=clr;
    }
    
    else
    {
        cell.returnButton.enabled=NO;
        cell.issueButton.enabled=YES;
        cell.returnButton.backgroundColor=[UIColor whiteColor];
        cell.issueButton.backgroundColor=clr;
    }
    
    //set the cell textlabel and button tag
    cell.textLabel.text = [_sharedBookManager getBookAtIndex:indexPath.row].title;
    cell.issueButton.tag=indexPath.row;
    cell.returnButton.tag=indexPath.row;
    cell.tag=indexPath.row;
    
    return cell;

}

-(void)didFinish
{
    //dissmiss the detail view 
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)tableView:(UITableView *)table accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    //perform segue and load the detail view
    [self performSegueWithIdentifier:@"detailViewSegue" sender:[self.table cellForRowAtIndexPath:indexPath]];
}

-(void)issueButton:(UIButton*)sender
{
    
    //call the method to issue book
    [_sharedBookManager bookIssuedAtIndex:sender.tag ];
    
    //display alert that book has been issued
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book is issued" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
    
    //reload the data only for a particular row
    indexPaths = [NSArray arrayWithObjects:
                  [NSIndexPath indexPathForRow:sender.tag inSection:0 ],
                  nil];
    
    [self.table reloadRowsAtIndexPaths:indexPaths withRowAnimation: UITableViewRowAnimationFade];
      
}

-(void)returnsButton:(UIButton*)sender
{
    
    //call the method to return book
    [_sharedBookManager bookReturnedAtIndex:sender.tag ];
    
    //display alert that book has been returned
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been returned" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    [alert release];
    
    //reload the data only for a particular row
    indexPaths = [NSArray arrayWithObjects:
                  [NSIndexPath indexPathForRow:sender.tag inSection:0 ],
                  nil];
    [self.table reloadRowsAtIndexPaths:indexPaths withRowAnimation: UITableViewRowAnimationFade];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(SBTableViewCell *)sender
{
  //send the index value to detail view
    if ([segue.identifier isEqualToString:@"detailViewSegue"])
    {
    SBDetailViewController *detailView = (SBDetailViewController *)segue.destinationViewController;
    detailView.books=[_sharedBookManager getBookAtIndex:sender.tag];
    detailView.delegate=self;
    }
}


- (void)dealloc {
    
    
    [_table release];
    [super dealloc];
}
@end
