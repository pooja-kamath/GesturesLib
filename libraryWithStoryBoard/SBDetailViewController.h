//
//  SBDetailViewController.h
//  libraryWithStoryBoard
//
//  Created by Pooja Kamath on 26/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookManager.h"
#include "SBBook.h"

@interface SBDetailViewController : UIViewController <UIAlertViewDelegate>

//book to display the details ,books values set through segue
@property (assign)SBBook *books;
@property (assign) SBBookManager *sharedBookManager;

@end
