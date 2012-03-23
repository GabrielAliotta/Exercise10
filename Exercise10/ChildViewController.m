//
//  ChildViewController.m
//  Exercise10
//
//  Created by Gabriel Aliotta on 3/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ChildViewController.h"


@implementation ChildViewController
@synthesize myPickerView;
@synthesize myTextField;
@synthesize myButton;
@synthesize fileNames;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [fileNames release];
    [myPickerView release];
    [myTextField release];
    [myButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSArray *listOfFiles = [fm contentsOfDirectoryAtPath:documentsDirectory error:nil];
    fileNames = [[NSMutableArray alloc] initWithArray:listOfFiles];
    
    if([fileNames count] > 0){
        NSString *fullFileName = [NSString stringWithFormat:@"%@/%@",
                                  documentsDirectory,
                                  [fileNames objectAtIndex:0]];
        NSString *retrievedString = [NSString stringWithContentsOfFile:fullFileName
                                                          usedEncoding:NO
                                                                 error:nil];
        myTextField.text = retrievedString;
    }
}

- (void)viewDidUnload
{
    [self setMyPickerView:nil];
    [self setMyTextField:nil];
    [self setMyButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveTextFile:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%i.txt",[fileNames count]];
    NSString *fullFileName = [NSString stringWithFormat:@"%@/%i.txt",documentsDirectory,[fileNames count]];
    [myTextField.text writeToFile:fullFileName atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
    [fileNames addObject:fileName];
    [myPickerView reloadAllComponents];
    [myPickerView selectRow:[fileNames count] - 1 inComponent:0 animated:YES];
    myTextField.text = @"";
}

# pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

# pragma mark UIPickerViewDelegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:
(NSInteger)component{
    return [fileNames count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row
           forComponent:(NSInteger)component{
    return [fileNames objectAtIndex:row];
}

# pragma mark UIPickerViewDataSource

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullFileName = [NSString stringWithFormat:@"%@/%@", documentsDirectory, [fileNames objectAtIndex:row]];
    NSString *retrievedString = [NSString stringWithContentsOfFile:fullFileName usedEncoding:NO error:nil];
    myTextField.text = retrievedString;
}


@end
