//
//  SBDownloadViewController.m
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 29/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBDownloadViewController.h"


@interface SBDownloadViewController ()

//iboutlet of ok button
@property (retain, nonatomic) IBOutlet UIButton *okButton;



@end

@implementation SBDownloadViewController

@synthesize downloadedData;
@synthesize progressView;
@synthesize  timeLabel;
@synthesize  length;
@synthesize downloadingLabel;
@synthesize connection;
@synthesize urlToDownload;
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
    
    //create a mutable data object to store the  data that is being downloaded
    downloadedData = [[NSMutableData alloc]init];
    
    
    //create a object of nsurlconnection with url object
   connection=[NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlToDownload]]delegate:self];
    
    //set progressbar style and initial value
    progressView.progressViewStyle=UIProgressViewStyleDefault;
    progressView.progress=0.0 ;
    _okButton.enabled=NO;
    
    
}
- (IBAction)backButton:(id)sender
{
    //cancel the connection that is downloading
    [connection cancel];
    
    //call the delegate to dismiss the viewcontroller
    [delegate didFinishLoading];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //get the length of the data that is to be downloaded
    length = (NSInteger)[response expectedContentLength];
       
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //append the data that is recieved to previously recieved data
    [downloadedData appendData:data];
    
    //calculate the percentage of the data downloaded
    float progressValue =  (float)([downloadedData length]/length);
    timeLabel.text = [NSString stringWithFormat:@"%0.0f%%",progressValue*100];
   
    //set the progress bar value with the percentage of data downloaded
    [progressView setProgress:(progressValue) animated:YES];
   
}

//if the connection fails print a log messege on the console
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}

//when the download is complete enable the ok button and save the downloaded contents to a file
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  
    downloadingLabel.text=@"Download Complete";
   _okButton.enabled=YES;
    [self saveLocally:downloadedData];
    
}

- (void)saveLocally:(NSData *)imgData
{
    NSString *fileToWrite=@"/Users/poojakamath/Desktop/strybrd-master copy 2/download.pdf ";
    
        [imgData writeToFile:fileToWrite atomically:YES];
}


- (IBAction)oKButton:(id)sender {
    
    //load the next view containing a web view
    UIViewController *pdfView = [self.storyboard instantiateViewControllerWithIdentifier:@"pdfView"];
    [self.navigationController pushViewController:pdfView animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    
   
   [downloadedData release];
   [downloadingLabel release];
    [progressView release];
    [timeLabel release];
    [_okButton release];
   
    [super dealloc];
    
}





@end
