//
//  SBDetailViewController.m
//  libraryWithStoryBoard
//
//  Created by Pooja Kamath on 26/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBDetailViewController.h"
#import "SBBook.h"
#import "SBBookManager.h"
@interface SBDetailViewController ()
@property (retain, nonatomic) IBOutlet UITextField *titleLabel;
@property (retain, nonatomic) IBOutlet UITextField *bookIdLabel;

@property (retain, nonatomic) IBOutlet UIButton *saveButton;
@property (retain, nonatomic) IBOutlet UITextField *authorLabel;
@property (retain, nonatomic) IBOutlet UIButton *okButton;
@property (retain, nonatomic) IBOutlet UIButton *editButton;
@property (retain, nonatomic) IBOutlet UIButton *deleteButton;
@property (retain, nonatomic) IBOutlet UIButton *cancelButton;
- (IBAction)cancelButton:(id)sender;

- (IBAction)okButton:(id)sender;
- (IBAction)deleteButton:(id)sender;
- (IBAction)editButton:(id)sender;
- (IBAction)saveButton:(id)sender;
@property (retain, nonatomic) IBOutlet UISwitch *issueSwitch;

@end

@implementation SBDetailViewController

@synthesize books;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
        _sharedBookManager = [SBBookManager sharedManager];
    
    _titleLabel.delegate=self;
    _authorLabel.delegate=self;
    _bookIdLabel.delegate=self;

    NSLog(@"%@",books.title);
    //set the label values
    _titleLabel.text=self.books.title;
    _titleLabel.userInteractionEnabled=NO;
    _bookIdLabel.text=self.books.bookId;
    _bookIdLabel.userInteractionEnabled=NO;
    _authorLabel.text=self.books.author;
    _authorLabel.userInteractionEnabled=NO;
    _issueSwitch.On =self.books.issued;
    _issueSwitch.userInteractionEnabled=NO;
    
    _saveButton.userInteractionEnabled=NO;
    _saveButton.hidden=YES;
    
    _cancelButton.userInteractionEnabled=NO;
    _cancelButton.hidden=YES;
    
    

    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    [super setEditing:flag animated:animated];
    if (flag == YES)
    {
        // Change views to edit mode.
        _titleLabel.userInteractionEnabled=YES;
        _bookIdLabel.userInteractionEnabled=YES;
        _authorLabel.userInteractionEnabled=YES;
        _issueSwitch.userInteractionEnabled=YES;
        _okButton.hidden=YES;
        _okButton.userInteractionEnabled=NO;
        _editButton.userInteractionEnabled=NO;
        _deleteButton.userInteractionEnabled=NO;
        _editButton.hidden=YES;
        _deleteButton.hidden=YES;
        _cancelButton.hidden=NO;
        _cancelButton.userInteractionEnabled=YES;
        _saveButton.userInteractionEnabled=YES;
        _saveButton.hidden=NO;
        
    }
    else
    {
        // Save the changes if needed and change the views to noneditable.
        
        
        
        _titleLabel.text=self.books.title;
        _titleLabel.userInteractionEnabled=NO;
        
        _bookIdLabel.text=self.books.bookId;
        _bookIdLabel.userInteractionEnabled=NO;
        
        _authorLabel.text=self.books.author;
        _authorLabel.userInteractionEnabled=NO;
        
        _issueSwitch.On =self.books.issued;
        _issueSwitch.userInteractionEnabled=NO;
        
        _saveButton.userInteractionEnabled=NO;
        _saveButton.hidden=YES;
        
        _cancelButton.userInteractionEnabled=NO;
        _cancelButton.hidden=YES;
        
        _okButton.userInteractionEnabled=YES;
        _okButton.hidden=NO;
        
        _editButton.userInteractionEnabled=YES;
        _editButton.hidden=NO;
        
        _deleteButton.userInteractionEnabled=YES;
        _deleteButton.hidden=NO;

    }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"YES"])
    {
        //call the method to remove the book in shared manager
        [_sharedBookManager  removeBook:books];
       
        //display alert that book has been deleted
        UIAlertView *alertAfterDeletion=[[UIAlertView alloc]initWithTitle:@"alert" message:@"book is deleted" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertAfterDeletion show];
        [alertAfterDeletion release];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
   
    
}

- (IBAction)cancelButton:(id)sender {
    
    [self setEditing:NO animated:YES];
}

- (IBAction)okButton:(id)sender
{
       
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deleteButton:(id)sender
{
    
    
    //display alert asking whether to delete a book or not
    UIAlertView *alertBeforeDeletion=[[[UIAlertView alloc]initWithTitle:@"alert" message:@"delete the book??" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil, nil]autorelease];
    
    [alertBeforeDeletion addButtonWithTitle:@"YES"];
    [alertBeforeDeletion show];

}

- (IBAction)editButton:(id)sender {
    [self setEditing:YES animated:YES];
    
}

- (IBAction)saveButton:(id)sender {
    
    SBBook *editedBook=[[SBBook alloc]init];
    editedBook.title=_titleLabel.text;
    editedBook.bookId=_bookIdLabel.text;
    editedBook.author=_authorLabel.text;
    editedBook.issued=_issueSwitch.on;
    
    [_sharedBookManager replaceBookAtIndex:[_sharedBookManager searchBookWithTitle:books.title] WithBook:editedBook];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been edited" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    [alert release];
    
    [editedBook release];
    editedBook=nil;
    
[self dismissViewControllerAnimated:YES completion:nil];
    


}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField ==_bookIdLabel)
    {
        //if the text field is empty then the text should change
        if ([string isEqualToString:@""]) return YES;
        {
            //if the length is less than 4 text should change
            if ((_bookIdLabel.text).length <4)
            {
                return YES;
                
            }
            //text is greater than four text field should not change
            else
            {
                return NO;
            }
        }
    }
    
    if(textField ==_authorLabel)
    {
        
        //if the text field is empty then the text should change
        
        if ([string isEqualToString:@""]) return YES;
        unichar c = [string characterAtIndex:0];
        
        //if numbers are not entered then text should change
        if (![[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c])
        {
            return YES;
        }
        else
        {
            return NO;
        }
        
        return YES;
    }
    
    
    return YES;
}



-(BOOL)textFieldShouldReturn:(UITextField *)textfield
{
    //resign the keyboard
    [textfield resignFirstResponder];
    return YES;
}

- (void)dealloc {
    
   
    [_issueSwitch release];
    _issueSwitch=nil;
    
    [_titleLabel release];
    _titleLabel=nil;
    
    [_bookIdLabel release];
    _bookIdLabel=nil;
    
    [_authorLabel release];
    _authorLabel=nil;
    
    [_okButton release];
    _okButton=nil;
    
    [_editButton release];
    _editButton=nil;
    
    [_deleteButton release];
    _deleteButton=nil;
    
    [_saveButton release];
    _saveButton=nil;
    
    [_cancelButton release];
    _cancelButton=nil;
    
    [super dealloc];
}

@end
