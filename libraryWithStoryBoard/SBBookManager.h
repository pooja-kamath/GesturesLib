//
//  SBBookManager.h
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBBook.h"
@interface SBBookManager : NSObject

+ (id)sharedManager ;

//array to store the book objects
@property (retain) NSMutableArray *bookArray;

//method to pass the list of books title
-(SBBook *)getBookAtIndex:(NSInteger)indexPath;

//method to create a book object and add it to the array
-(void)addBookwithTitle:(NSString *)title bookId:(NSString*)bid author:(NSString*)author andIssued:(BOOL)issued;


//method to remove a book from the array
-(void)removeBook:(id)book;


//method to issue book
-(void)bookIssuedAtIndex:(NSInteger)bookIndex;

//method to return the book
-(void)bookReturnedAtIndex:(NSInteger)bookIndex;

//method to return the no of books 
-(NSInteger )getNumberOfBooksAdded;
-(NSInteger)searchBookWithTitle:(NSString *)titleToSearch;

@end
