//
//  Exercise10AppDelegate.h
//  Exercise10
//
//  Created by Gabriel Aliotta on 3/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChildViewController;

@interface Exercise10AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ChildViewController *viewController;

@end
