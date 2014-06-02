//
//  SBBookManager.m
//  library management
//
//  Created by Pooja Kamath on 15/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBBookManager.h"
#import "SBBook.h"

@implementation SBBookManager

@synthesize bookArray;

//making the manager singleton
+ (id)sharedManager {
    static SBBookManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ sharedMyManager = [[self alloc] init];});
    
    return sharedMyManager;
}


- (id)init
{
    self = [super init];
    if (self) {
        bookArray=[[NSMutableArray alloc]init];

    }
    return self;
}

-(void)addBookwithTitle:(NSString *)title bookId:(NSString*)bid author:(NSString*)author andIssued:(BOOL)issued
{
       
    //create a book object with the values passed
    SBBook * book =[[SBBook alloc]init];
    book.title=title;
    book.bookId=bid;
    book.author=author;
    book.issued=issued;
    
    //add the book created to the array
    [bookArray addObject:book];
  

    //sort the books added to the array
    [bookArray sortUsingComparator: ^(SBBook *obj1, SBBook *obj2) {
       return[obj1.title compare:obj2.title options:NSLiteralSearch ];
    }];
    [book release];
   
    
}

-(SBBook *)getBookAtIndex:(NSInteger)indexPath
{
    //return book at the index
    return [bookArray objectAtIndex:indexPath];
    
}

-(void)bookIssuedAtIndex:(NSInteger) bookIndex
{
    //set the issued property of the selected book to yes
   
    SBBook *book=[bookArray objectAtIndex:bookIndex];
    
       book.issued=YES;
        
    
  }
-(void)bookReturnedAtIndex:(NSInteger)bookIndex
{
    //set the issued property of the selected book to no
    
    SBBook *book=[bookArray objectAtIndex:bookIndex];
    
    book.issued=NO;
    
}

-(NSInteger )getNumberOfBooksAdded
{
    //return the no of books added
    return [bookArray count];
}

-(void)removeBook:(id)book
{
    //remove the book identical to the recieved book object
    [bookArray removeObjectIdenticalTo:book];
    
    
}
-(NSInteger)searchBookWithTitle:(NSString *)titleToSearch
{
//   NSLog(@"%lu",(unsigned long)[bookArray indexOfObjectIdenticalTo:titleToSearch]);
    for (SBBook *book in bookArray) {
        if([book.title isEqualToString:titleToSearch])
        {
         return [bookArray indexOfObjectIdenticalTo:book];
        }
        
    }
    return -1;

}
- (void)dealloc
{
    
    [bookArray release];
    bookArray=nil;
    [super dealloc];
    
    
}
@end
