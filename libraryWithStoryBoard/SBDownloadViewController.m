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
@property (retain, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (retain, nonatomic) IBOutlet UIButton *cancelButton;
//expected length of the image that is downloaded
@property(nonatomic, assign) float length;


@end

@implementation SBDownloadViewController

@synthesize downloadedData;
@synthesize progressView;
@synthesize  timeLabel;
@synthesize  length;
@synthesize downloadingLabel;
@synthesize connectionToDownload;
@synthesize urlToDownload;


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
   connectionToDownload=[NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlToDownload]]delegate:self];
    
     //set progressbar style and initial value
    progressView.progressViewStyle=UIProgressViewStyleDefault;
    progressView.progress=0.0;
    _okButton.enabled=NO;
    _backButton.enabled=NO;
       
}

- (IBAction)cancelButton:(id)sender
{
    [connectionToDownload cancel];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backButton:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
    _backButton.enabled=YES;
    [self saveLocally:downloadedData];
    
  [downloadedData release];
    downloadedData=nil;
    
    [progressView release];
    progressView=nil;
   
    _cancelButton.enabled=NO;
    [_cancelButton release];
    _cancelButton=nil;
    
    [timeLabel release];
    timeLabel=nil;
    
}

- (void)saveLocally:(NSData *)data
{
    NSString *fileToWrite=@"/Users/poojakamath/Desktop/strybrd-master copy 4/download.pdf ";
           [data writeToFile:fileToWrite atomically:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
     
    [downloadedData release];
    downloadedData=nil;
    [progressView release];
    progressView=nil;
      [downloadingLabel release];
    downloadingLabel=nil;
       [timeLabel release];
    timeLabel=nil;
  [_cancelButton release];
    _cancelButton=nil;
    [_backButton release];
    _backButton=nil;
          [_okButton release];
    _okButton=nil;
       
    [super dealloc];
    
}





@end
