//
//  SBDownloadViewController.h
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 29/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SBDownloadViewController : UIViewController

//label to represent downloading or download complete
@property (retain, nonatomic) IBOutlet UILabel *downloadingLabel;

//progress bar
@property (retain, nonatomic) IBOutlet UIProgressView *progressView;

//label to show the percentage of download
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;


//object of nsurlconnection
@property (assign) NSURLConnection *connectionToDownload;


//mutable data that stores the image data that is being downloaded
@property(nonatomic, strong) NSMutableData *downloadedData;


//url of the pdf that is to be downloaded,value set through segue
@property (assign) NSString *urlToDownload;

@end
