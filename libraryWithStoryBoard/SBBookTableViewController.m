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
@synthesize delegate;
@synthesize cell;
@synthesize urls;

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
    
    
    //put the book names in bookTable array
    [self.bookTable registerClass:[SBBookTableViewCell class] forCellReuseIdentifier:@"bookTableCell"];
    bookList=[[NSArray alloc]initWithObjects: @"programming guide",@"RoadMap iOS",@"mobile hig",@"iPhoneOS",@"ViewPG_iPhoneOS",@"KernelProgramming",@"Xcode_Overview",nil];
    
    
    //put the url in the url array
    urls=[[NSArray alloc]initWithObjects:
    @"https://developer.apple.com/library/ios/documentation/iphone/conceptual/iphoneosprogrammingguide/iphoneappprogrammingguide.pdf",
    @"https://developer.apple.com/library/ios/referencelibrary/GettingStarted/RoadMapiOS/RoadMapiOS.pdf",
    @"https://developer.apple.com/library/ios/documentation/userexperience/conceptual/mobilehig/MobileHIG.pdf",
    @"https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/ViewPG_iPhoneOS.pdf",
    @"https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/ViewPG_iPhoneOS.pdf",
    @"https://developer.apple.com/library/mac/documentation/Darwin/Conceptual/KernelProgramming/KernelProgramming.pdf",
    @"https://developer.apple.com/library/mac/documentation/ToolsLanguages/Conceptual/Xcode_Overview/Xcode_Overview.pdf",
    nil];
    
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
    cell.textLabel.text = [bookList objectAtIndex:indexPath.row];
    cell.downloadButton.tag=indexPath.row;
    
            return cell;
}


-(void)didFinishLoading
{
        //dissmiss the detail view
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)downloadButton:(UIButton*)sender
{
    //perform the segue to load the download page
    [self performSegueWithIdentifier:@"bookListSegue" sender:[urls objectAtIndex:sender.tag]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSString *)sender
{
   //set the url to download string in download view with the url of the book to be downloaded
      SBDownloadViewController *downloadView = (SBDownloadViewController *)segue.destinationViewController;
     downloadView.urlToDownload=sender;
    
    //set the download view s delegate as self
     downloadView.delegate=self;
    
   
}

- (void)dealloc
{
    
    [bookList release];
    bookList=nil;
    [urls release];
    urls=nil;
    [_bookTable release];
    _bookTable=nil;
    [super dealloc];
}
@end
