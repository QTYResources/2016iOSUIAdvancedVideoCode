//
//  EditViewController.h
//  AddressBook4
//
//  Created by QinTuanye on 2019/5/27.
//  Copyright © 2019 QinTuanye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@class EditViewController;

@protocol EditViewControllerDelegate <NSObject>

@optional
- (void)editViewController:(EditViewController*)editViewController withContact:(Contact*)contact;

@end

@interface EditViewController : UIViewController

@property (nonatomic, strong) Contact* contact;

@property (nonatomic, weak) id<EditViewControllerDelegate> delegate;

@end
