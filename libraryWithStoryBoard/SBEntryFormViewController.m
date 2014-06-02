//
//  SBEntryFormViewController.m
//  libraryWithStoryBoard
//
//  Created by Pooja Kamath on 26/05/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBEntryFormViewController.h"

#import "SBBookManager.h"

@interface SBEntryFormViewController ()

@property (retain, nonatomic) IBOutlet UITextField *titleText;
@property (retain, nonatomic) IBOutlet UITextField *bookIdText;

@property (retain, nonatomic) IBOutlet UITextField *authorText;
@property (retain, nonatomic) IBOutlet UISwitch *issueSwitch;

- (IBAction)AddButton:(id)sender;

@end

@implementation SBEntryFormViewController

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
    // Do any additional setup after loading the view from its nib.
        
     _sharedBookManager = [SBBookManager sharedManager];
    
    //set the text field delegate to self
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    //set the delegates of the text view
    _titleText.delegate=self ;
    _bookIdText.delegate = self;
    _authorText.delegate=self;
    
    

}
- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField ==_bookIdText)
    {
        //if the text field is empty then the text should change
        if ([string isEqualToString:@""]) return YES;
        {
            //if the length is less than 4 text should change
            if ((_bookIdText.text).length <4)
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
    
    if(textField ==_authorText)
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


- (IBAction)AddButton:(id)sender {
    
    
    //if any textfield is blank display alert
    if([_titleText.text isEqual:@""] ||[_bookIdText.text isEqual:@""] || [_authorText.text isEqual:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"book is not added because of invalid inputs" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
    
    else
    {
       
        //call the  book manager method to add the book to the array
        [_sharedBookManager addBookwithTitle:_titleText.text bookId:_bookIdText.text author:_authorText.text andIssued:_issueSwitch.on];
        
        //show alert that book has been added
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"alert" message:@"the book has been added" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [alert release];
        
        //push the table view
        UITableViewController *table = [self.storyboard instantiateViewControllerWithIdentifier:@"tableViews"];
        [self.navigationController pushViewController:table animated:YES];
        
       
      }

}
- (IBAction)cancelButton:(id)sender
{
    //push the table view
    UITableViewController *table = [self.storyboard instantiateViewControllerWithIdentifier:@"tableViews"];
    [self.navigationController pushViewController:table animated:YES];
    

}
- (void)dealloc {
    
    [_titleText release];
    _titleText=nil;
    [_bookIdText release];
    _bookIdText=nil;
    [_authorText release];
    _authorText=nil;
    [_issueSwitch release];
    _issueSwitch=nil;
    
    [super dealloc];
}
@end
