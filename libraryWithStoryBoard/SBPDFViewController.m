//
//  SBPDFViewController.m
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 30/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBPDFViewController.h"
#import "SBTableViewController.h"
@interface SBPDFViewController ()

@property (retain, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)exitButton:(id)sender;

@end

@implementation SBPDFViewController

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
    
    
    //load the file that is downloaded and saved in the webview
    NSString *path = @"/Users/poojakamath/Desktop/strybrd-master copy 3/download.pdf ";
    NSURL *targetURL = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
   
    [_webView loadRequest:request];
    
    //add the web view to the subview and release
    [self.view addSubview:_webView];
    [_webView release];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//delete the file created and push the initial view
- (IBAction)exitButton:(id)sender {
    
    NSFileManager *manager = [NSFileManager defaultManager];
    // Need to check if the to be deleted file exists.
    if ([manager fileExistsAtPath:@"/Users/poojakamath/Desktop/strybrd-master copy 2/download.pdf "]) {
        NSError *error = nil;
        // This function also returnsYES if the item was removed successfully or if path was nil.
        // Returns NO if an error occurred.
        [manager removeItemAtPath:@"/Users/poojakamath/Desktop/strybrd-master copy 2/download.pdf " error:&error];
        if (error) {
            NSLog(@"There is an Error: %@", error);
        }
    } else {
        NSLog(@"File doesn't exists" );
    }
    [manager release];
   //push initial view controller
    
    UITabBarController *tab=[self.storyboard instantiateViewControllerWithIdentifier:@"initialView"];
    [self.navigationController pushViewController:tab animated:YES];
    
    
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer
{

    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
        recognizer.scale = 1;
    
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (void)dealloc {
    [_webView release];
    _webView=nil;
    [super dealloc];
}
@end
