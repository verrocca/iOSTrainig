//
//  EditItemViewController.h
//  ItemListExample
//
//  Created by Pablo Luis Pellegrino on 10/17/17.
//  Copyright © 2017 Pablo Luis Pellegrino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MarketItemModel;

@protocol EditItemViewControllerDelegate

-(void) notifyNewItemCreated:(MarketItemModel*)newItem;

-(void) notifyItemEdited:(MarketItemModel *)editedItem;

-(void) notifyItemDeleted:(MarketItemModel *)deletedItem;

@end

@interface EditItemViewController : UIViewController

-(instancetype) initWithDelegate:(id<EditItemViewControllerDelegate>)delegate;

-(instancetype) initWithEditableItem:(MarketItemModel*)item delegate:(id<EditItemViewControllerDelegate>)delegate;

@end
