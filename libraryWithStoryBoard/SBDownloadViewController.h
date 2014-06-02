//
//  SBDownloadViewController.h
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 29/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBPDFViewController.h"
@protocol downloadViewDelegate

//delegate to dismiss the view controller
-(void)didFinishLoading;

@end

@interface SBDownloadViewController : UIViewController

//label to represent downloading or download complete
@property (retain, nonatomic) IBOutlet UILabel *downloadingLabel;

//progress bar
@property (retain, nonatomic) IBOutlet UIProgressView *progressView;

//label to show the percentage of download
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;

//button to go to the next view displaying the pdf
- (IBAction)oKButton:(id)sender;

//object of nsurlconnection
@property (assign) NSURLConnection *connection;


//mutable data that stores the image data that is being downloaded
@property(nonatomic, strong) NSMutableData *downloadedData;

//expected length of the image that is downloaded
@property(nonatomic, assign) float length;

//url of the pdf that is to be downloaded
@property (assign) NSString *urlToDownload;

//delegate to call didFinishLoading
@property (assign) id delegate;
@end
