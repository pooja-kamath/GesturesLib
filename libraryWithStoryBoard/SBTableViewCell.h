//
//  SBTableViewCell.h
//  libraryWithStoryBoard
//
//  Created by Pooja Kamath on 26/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookManager.h"
@protocol cellDelegate


//delegate called on clicking issue button
-(void)issueButton:(UIButton*)sender;

//delegate called on clicking return button
-(void)returnsButton:(UIButton*)sender;

@end


@interface SBTableViewCell : UITableViewCell

@property (assign)NSInteger tag;
@property (assign) id delegate;
@property (assign) UIButton *issueButton;

@property (assign) UIButton *returnButton;


@end
