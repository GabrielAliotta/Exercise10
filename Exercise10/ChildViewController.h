//
//  ChildViewController.h
//  Exercise10
//
//  Created by Gabriel Aliotta on 3/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChildViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate> {

}
@property (nonatomic, retain) IBOutlet UIPickerView *myPickerView;
@property (nonatomic, retain) IBOutlet UITextField *myTextField;
@property (nonatomic, retain) IBOutlet UIButton *myButton;
- (IBAction)saveTextFile:(id)sender;

@end
