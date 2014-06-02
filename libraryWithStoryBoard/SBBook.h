//
//  SBBook.h
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBBook : NSObject
//title of book
@property (retain) NSString *title;

//id of the book
@property (retain) NSString *bookId;

//author of the book
@property (retain) NSString *author;

//set to Yes if the book is issued or else set to No
@property(assign) bool issued;

@end
