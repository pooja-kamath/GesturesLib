//
//  SBSearchViewController.h
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 28/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookManager.h"
#import "SBDetailViewController.h"
@interface SBSearchViewController : UIViewController <detailViewDelegate>

@property (assign) SBBookManager *sharedBookManager;

@end
