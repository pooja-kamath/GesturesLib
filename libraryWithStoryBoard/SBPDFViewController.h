//
//  SBPDFViewController.h
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 30/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBPDFViewController : UIViewController 
@property (assign)id delegate;
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
@end
