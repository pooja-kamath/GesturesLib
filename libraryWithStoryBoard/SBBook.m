//
//  SBBook.m
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBook.h"

@implementation SBBook
@synthesize title;
@synthesize bookId;
@synthesize author;
@synthesize issued;


- (void)dealloc
{
    
    [ title release];
    title=nil;
    [ bookId release];
    bookId=nil;
    [ author release];
    author=nil;
    [super dealloc];
}

@end
