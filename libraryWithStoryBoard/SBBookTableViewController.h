//
//  SBBookTableViewController.h
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 02/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookTableViewCell.h"
#import "SBDownloadViewController.h"
@interface SBBookTableViewController : UITableViewController <UITableViewDataSource ,UITableViewDelegate,bookCellDelegate>

//shared manager instance
@property (assign)   SBBookTableViewCell *cell;

//array containing the list of books to download
@property (assign) NSMutableArray *bookList;

@end

