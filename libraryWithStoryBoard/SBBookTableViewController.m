//
//  SBBookTableViewController.m
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 02/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBookTableViewController.h"
#import "SBDownloadViewController.h"
@interface SBBookTableViewController ()
@property (retain, nonatomic) IBOutlet UITableView *bookTable;

@end

@implementation SBBookTableViewController
@synthesize bookList;
@synthesize cell;


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
   
    self.bookList= [NSMutableArray arrayWithContentsOfFile:@"/Users/poojakamath/Desktop/strybrd-master copy 4/bookList.plist"];
  
    
      //put the book names in bookTable array
    [self.bookTable registerClass:[SBBookTableViewCell class] forCellReuseIdentifier:@"bookTableCell"];
      [bookList retain];
 
       //hide the back button
    self.navigationItem.hidesBackButton=YES;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)bookTable
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)bookTable numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [bookList count];
}


- (UITableViewCell *)tableView:(UITableView *)bookTable cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
         cell = [_bookTable dequeueReusableCellWithIdentifier:@"bookTableCell"];
    
    //assign self as the delegate of the cell
    cell.delegate=self;
    
    
    
    //set the cell label and download button tag is set with row value
    cell.textLabel.text =  self.bookList[indexPath.row][@"bookList"];
    cell.downloadButton.tag=indexPath.row;
    
            return cell;
}



-(void)downloadButton:(UIButton*)sender
{
       //perform the segue to load the download page
    //[self performSegueWithIdentifier:@"bookListSegue" sender:self.bookList[sender.tag][@"bookUrl"]];
    [self performSegueWithIdentifier:@"bookListSegue" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    //set the url to download string in download view with the url of the book to be downloaded
    SBDownloadViewController *downloadView = (SBDownloadViewController *)segue.destinationViewController;
    downloadView.urlToDownload=self.bookList[sender.tag][@"bookUrl"];
     
}
- (void)dealloc
{
    [bookList release];
    bookList=nil;
    
    
    [_bookTable release];
    _bookTable=nil;
    
    [super dealloc];
}
@end
