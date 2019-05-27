//
//  AddViewController.h
//  AddressBook2
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@class AddViewController;

@protocol AddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(AddViewController*)addViewController withContact:(Contact*)contact;

@end

@interface AddViewController : UIViewController

@property (nonatomic, weak) id<AddViewControllerDelegate> delegate;

@end
