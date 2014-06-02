//
//  SBBookTableViewCell.h
//  LibraryWithStoryBoard
//
//  Created by Pooja Kamath on 02/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol bookCellDelegate
//delegate called on clicking download button
-(void)downloadButton:(UIButton*)sender;
@end

@interface SBBookTableViewCell : UITableViewCell

@property (assign) UIButton *downloadButton;
@property (assign) id delegate;

@end
