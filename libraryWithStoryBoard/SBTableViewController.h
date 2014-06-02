//
//  SBTableTableViewController.h
//  libraryWithStoryBoard
//
//  Created by Pooja Kamath on 26/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookManager.h"
#import "SBTableViewCell.h"
#import "SBDetailViewController.h"
@interface SBTableViewController : UITableViewController <UITableViewDataSource ,UITableViewDelegate,cellDelegate,detailViewDelegate>

//shared manager instance
@property (assign) SBBookManager *sharedBookManager;

//indexpath to store the indexpaths to load individual rows
@property (assign ) NSArray *indexPaths;

//table view cell
@property (assign)   SBTableViewCell *cell;

@end
